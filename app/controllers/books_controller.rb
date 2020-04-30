class BooksController < ApplicationController
  before_action :auth_required

  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_person

  def index

    year = params[:year]
 
    @filter_status = params[:status] 
    case @filter_status
      when "enviados"
        status = Book::SENT
      when "aceptados"
        status = Book::ACCEPTED
      when "publicados"
        status = Book::PUBLISHED
      when "rechazados"
        status = Book::REJECTED
      else
        @filter_status = 'todos'
    end
       
    @all_books = Book.left_outer_joins(:product_participants).where("(product_participants.person_id=? AND product_participants.status=?) OR (books.person_id = ?)", @person.id, ProductParticipant::ACTIVE, @person.id).group('books.id') 

    @books = @all_books


    if params[:status] == 'todos'
      if !year.blank?
        @books = @books.where("YEAR(last_date) = ?", year)
      end
    elsif !status.blank? && !year.blank?
      @books = @books.where("books.status = ? AND YEAR(last_date) = ?", status, year)
    elsif !status.blank?
      @books = @books.where("books.status = ?", status)
    else
      year = Date.today.year
      @books = @books.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @books = @books.order(last_date: :desc)

    min_date = @all_books.minimum(:last_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'profile'
  end

  def org_index

    year = params[:year]
 
    @filter_status = params[:status] 
    case @filter_status
      when "enviados"
        status = Book::SENT
      when "aceptados"
        status = Book::ACCEPTED
      when "publicados"
        status = Book::PUBLISHED
      when "rechazados"
        status = Book::REJECTED
      else
        @filter_status = 'todos'
    end
       
    @all_books = Book.all

    @books = @all_books


    if params[:status] == 'todos'
      if !year.blank?
        @books = @books.where("YEAR(last_date) = ?", year)
      end
    elsif !status.blank? && !year.blank?
      @books = @books.where("books.status = ? AND YEAR(last_date) = ?", status, year)
    elsif !status.blank?
      @books = @books.where("books.status = ?", status)
    else
      year = Date.today.year
      @books = @books.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @books = @books.order(last_date: :desc)

    min_date = @all_books.minimum(:last_date)
    
    @min_year = min_date.year rescue year
    puts "AÑO #{@min_year}"

    render :layout => 'org'
  end


  def show
    layout = 'org'
    layout = 'profile' if !@person.blank?
    render :layout => layout
  end

  def new
    @book = Book.new
    render :layout => 'profile'
  end

  def edit
    render :layout => 'profile'
  end

  def create
    @book = Book.new
    @book.title      = params[:title]
    @book.sent_date  = params[:sent_date]
    @book.authors    = params[:authors]
    @book.book_type  = params[:book_type]
    @book.publisher  = params[:publisher]
    @book.country_id  = params[:country_id]
    @book.is_refereed  = params[:is_refereed]
    @book.person_id  = current_user.id
    @book.status     = Book::SENT
    @book.last_date  = @book.sent_date

    if @book.save
      authors = @book.authors 
      authors_array = authors.split(',')
      c = 0
      authors_array.each do |author| 
        c = c + 1
        author_sanitized = author.remove('and').strip
        p = @book.product_participants.new
        p.author_is = author_sanitized
        p.participation = ProductParticipant::PARTICIPANT
        if c == 1
          p.participation = ProductParticipant::FIRST_AUTHOR
        end 

        if c == authors_array.count
          p.participation = ProductParticipant::CORRESPONDING
        end 
      
        pp = ProductParticipant.where(author_is: author_sanitized)
        if pp.count > 0
          ppp = pp.last!
          p.person_id = ppp.person_id
        end 
        p.status = ProductParticipant::UNASSIGNED
        p.save
      end
      log = @book.activity_logs.new 
      log.message = "Libro agregado: #{@book.title}"
      log.person_id = current_user.id
      log.save
      render json: @book
    end
  end

  def update
    respond_to do |format|

      if @book.update(book_params)
        changes = @book.changes
        if @book.status == Book::SENT
          @book.last_date = @book.sent_date
        elsif @book.status == Book::ACCEPTED
          @book.last_date = @book.accepted_date
        elsif @book.status == Book::PUBLISHED
          @book.last_date = @book.published_date
        elsif @book.status == Book::REJECTED
          @book.last_date = @book.rejected_date
        end
      
        @book.save

        log = @book.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "El libro #{@book.id} ha sido actualizado."
        log.save
          
        format.html { redirect_to edit_book_path(@person.shortname, @book.id), notice: 'El libro ha sido actualizado' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'El libro ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :authors, :book_type, :publisher, :is_refereed, :country_id, :status, :sent_date, :accepted_date, :published_date, :pages, :isbn)
    end
end
