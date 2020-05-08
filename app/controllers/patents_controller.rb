class PatentsController < ApplicationController
  before_action :auth_required

  before_action :set_patent, only: [:show, :edit, :update, :destroy]
  before_action :set_person


  def index

    year = params[:year]
 
    @filter_status = params[:status] 
    case @filter_status
      when "registro"
        status = Patent::REGISTER
      when "examen-de-forma"
        status = Patent::FORM_EXAM
      when "publicacion"
        status = Patent::PUBLISHED
      when "examen-de-fondo"
        status = Patent::EXAMINATION
      when "titulo-otorgado"
        status = Patent::GRANTED
      when "rechazada"
        status = Patent::REJECTED
      else
        @filter_status = 'todos'
    end
       
    @all_patents = Patent.left_outer_joins(:product_participants).where("(product_participants.person_id=? AND product_participants.status=?) OR (patents.person_id = ?)", @person.id, ProductParticipant::ACTIVE, @person.id).group('patents.id') 

    @patents = @all_patents


    if params[:status] == 'todos'
      if !year.blank?
        @patents = @patents.where("YEAR(last_date) = ?", year)
      end
    elsif !status.blank? && !year.blank?
      @patents = @patents.where("patents.status = ? AND YEAR(last_date) = ?", status, year)
    elsif !status.blank?
      @patents = @patents.where("patents.status = ?", status)
    else
      year = Date.today.year
      @patents = @patents.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @patents = @patents.order(last_date: :desc)

    min_date = @all_patents.minimum(:last_date)
    
    @min_year = min_date.year rescue year
    puts "AÑO #{@min_year}"

    render :layout => 'profile'
  end

  def org_index

    year = params[:year]
 
    @filter_status = params[:status] 
    case @filter_status
      when "registro"
        status = Patent::REGISTER
      when "examen-de-forma"
        status = Patent::FORM_EXAM
      when "publicacion"
        status = Patent::PUBLISHED
      when "examen-de-fondo"
        status = Patent::EXAMINATION
      when "titulo-otorgado"
        status = Patent::GRANTED
      when "rechazada"
        status = Patent::REJECTED
      else
        @filter_status = 'todos'
    end
       
    @all_patents = Patent.all

    @patents = @all_patents


    if params[:status] == 'todos'
      if !year.blank?
        @patents = @patents.where("YEAR(last_date) = ?", year)
      end
    elsif !status.blank? && !year.blank?
      @patents = @patents.where("patents.status = ? AND YEAR(last_date) = ?", status, year)
    elsif !status.blank?
      @patents = @patents.where("patents.status = ?", status)
    else
      year = Date.today.year
      @patents = @patents.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @patents = @patents.order(last_date: :desc)

    min_date = @all_patents.minimum(:last_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'org'
  end

  def show
    layout = 'org'
    layout = 'profile' if !@person.blank?
    render :layout => layout
  end

  def new
    @patent = Patent.new
    render :layout => 'profile'
  end

  def edit
    render :layout => 'profile'
  end

  def create
    @patent = Patent.new
    @patent.title      = params[:title]
    @patent.register_date  = params[:register_date]
    @patent.authors    = params[:authors]
    @patent.person_id  = current_user.id
    @patent.status     = Patent::REGISTER
    @patent.last_date  = @patent.register_date

    if @patent.save
      authors = @patent.authors 
      authors_array = authors.split(',')
      c = 0
      authors_array.each do |author| 
        c = c + 1
        author_sanitized = author.remove('and').strip
        p = @patent.product_participants.new
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
      log = @patent.activity_logs.new 
      log.message = "Patente agregada: #{@patent.title}"
      log.person_id = current_user.id
      log.save
      render json: @patent
    end
  end

  def update
    respond_to do |format|

      if @patent.update(patent_params)
        changes = @patent.changes
      
        @patent.save

        log = @patent.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "La patente #{@patent.id} ha sido actualizada."
        log.save
          
        format.html { redirect_to edit_patent_path(@person.shortname, @patent.id), notice: 'La patente ha sido actualizada' }
        format.json { render :show, status: :ok, location: @patent }
      else
        format.html { render :edit }
        format.json { render json: @patent.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patent.destroy
    respond_to do |format|
      format.html { redirect_to patents_url, notice: 'La patente ha sido eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    def set_patent
      @patent = Patent.find(params[:id])
    end

    def patent_params
      params.require(:patent).permit(:title, :register_date, :authors, :person_id, :status)
    end
end


