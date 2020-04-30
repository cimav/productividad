class ConferencePapersController < ApplicationController
  before_action :auth_required

  before_action :set_conference_paper, only: [:show, :edit, :update, :destroy]
  before_action :set_person

  def index

    year = params[:year]
 
    @filter_status = params[:status] 
    case @filter_status
      when "enviados"
        status = ConferencePaper::SENT
      when "aceptados"
        status = ConferencePaper::ACCEPTED
      when "publicados"
        status = ConferencePaper::PUBLISHED
      when "rechazados"
        status = ConferencePaper::REJECTED
      else
        @filter_status = 'todos'
    end
       
    @all_conference_papers = ConferencePaper.left_outer_joins(:product_participants).where("(product_participants.person_id=? AND product_participants.status=?) OR (conference_papers.person_id = ?)", @person.id, ProductParticipant::ACTIVE, @person.id).group('conference_papers.id') 

    @conference_papers = @all_conference_papers


    if params[:status] == 'todos'
      if !year.blank?
        @conference_papers = @conference_papers.where("YEAR(last_date) = ?", year)
      end
    elsif !status.blank? && !year.blank?
      @conference_papers = @conference_papers.where("conference_papers.status = ? AND YEAR(last_date) = ?", status, year)
    elsif !status.blank?
      @conference_papers = @conference_papers.where("conference_papers.status = ?", status)
    else
      year = Date.today.year
      @conference_papers = @conference_papers.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @conference_papers = @conference_papers.order(last_date: :desc)

    min_date = @all_conference_papers.minimum(:last_date)
    
    @min_year = min_date.year rescue year
    puts "AÑO #{@min_year}"

    render :layout => 'profile'
  end

  def org_index

    year = params[:year]
 
    @filter_status = params[:status] 
    case @filter_status
      when "enviados"
        status = ConferencePaper::SENT
      when "aceptados"
        status = ConferencePaper::ACCEPTED
      when "publicados"
        status = ConferencePaper::PUBLISHED
      when "rechazados"
        status = ConferencePaper::REJECTED
      else
        @filter_status = 'todos'
    end
       
    @all_conference_papers = ConferencePaper.all

    @conference_papers = @all_conference_papers


    if params[:status] == 'todos'
      if !year.blank?
        @conference_papers = @conference_papers.where("YEAR(last_date) = ?", year)
      end
    elsif !status.blank? && !year.blank?
      @conference_papers = @conference_papers.where("conference_papers.status = ? AND YEAR(last_date) = ?", status, year)
    elsif !status.blank?
      @conference_papers = @conference_papers.where("conference_papers.status = ?", status)
    else
      year = Date.today.year
      @conference_papers = @conference_papers.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @conference_papers = @conference_papers.order(last_date: :desc)

    min_date = @all_conference_papers.minimum(:last_date)
    
    @min_year = min_date.year rescue year
    puts "AÑO #{@min_year}"

    render :layout => 'org'
  end


  def show
    layout = 'org'
    if !@person.blank?
      layout = 'profile'
    end
    render :layout => layout
  end


  def new
    @conference_paper = ConferencePaper.new
    render :layout => 'profile'
  end

  def edit
    render :layout => 'profile'
  end

  def create
    @conference_paper = ConferencePaper.new
    @conference_paper.title      = params[:title]
    @conference_paper.sent_date  = params[:sent_date]
    @conference_paper.authors    = params[:authors]
    @conference_paper.conference_id = params[:conference_id]
    @conference_paper.person_id  = current_user.id
    @conference_paper.status     = ConferencePaper::SENT
    @conference_paper.last_date  = @conference_paper.sent_date

    if @conference_paper.save
      authors = @conference_paper.authors 
      authors_array = authors.split(',')
      c = 0
      authors_array.each do |author| 
        c = c + 1
        author_sanitized = author.remove('and').strip
        p = @conference_paper.product_participants.new
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
      log = @conference_paper.activity_logs.new 
      log.message = "Artículo agregado: #{@conference_paper.title}"
      log.person_id = current_user.id
      log.save
      render json: @conference_paper
    end
  end

  def update
    respond_to do |format|

      if @conference_paper.update(conference_paper_params)
        changes = @conference_paper.changes
        if @conference_paper.status == ConferencePaper::SENT
          @conference_paper.last_date = @conference_paper.sent_date
        elsif @conference_paper.status == ConferencePaper::ACCEPTED
          @conference_paper.last_date = @conference_paper.accepted_date
        elsif @conference_paper.status == ConferencePaper::PUBLISHED
          @conference_paper.last_date = @conference_paper.published_date
        elsif @conference_paper.status == ConferencePaper::REJECTED
          @conference_paper.last_date = @conference_paper.rejected_date
        end
      
        @conference_paper.save

        log = @conference_paper.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "El artículo #{@conference_paper.id} ha sido actualizado."
        log.save
          
        format.html { redirect_to edit_conference_paper_path(@person.shortname, @conference_paper.id), notice: 'El artículo ha sido actualizado' }
        format.json { render :show, status: :ok, location: @conference_paper }
      else
        format.html { render :edit }
        format.json { render json: @conference_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @conference_paper.destroy
    respond_to do |format|
      format.html { redirect_to conference_papers_url, notice: 'El artículo ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_conference_paper
      @conference_paper = ConferencePaper.find(params[:id])
    end

    def conference_paper_params
      params.require(:conference_paper).permit(:title, :sent_date, :accepted_date, :published_date, :conference_id, :authors, :abstract, :person_id, :status)
    end
end

