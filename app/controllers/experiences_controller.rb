class ExperiencesController < ApplicationController
  before_action :auth_required
  before_action :set_experience, only: [:update_experience, :delete_experience]


  def ui
    @person = Person.find(params[:person_id])
    render layout: false
  end

  def edit
    @person = Person.find(params[:person_id])
    @experience = Experience.find(params[:experience_id])
    render layout: false
  end

  def update_experience
    @experience.person_id          = params[:person_id] 
    @experience.title              = params[:title]
    @experience.experience_type_id = params[:experience_type]
    @experience.company            = params[:company]
    @experience.description        = params[:description]
    @experience.location           = params[:location]
    @experience.start_date         = params[:start_date]
    @experience.end_date           = params[:end_date]
    @experience.status = Experience::ACTIVE 

    if @experience.save
      json = {}
      json[:id] = @experience.id
      json[:message] = 'Participante actualizado'
      render :json => json
    else
      flash[:error] = 'No se pudo actualizar el participante'
      json = {}
      json[:flash] = flash
      json[:errors] = @experience.errors
      render :json => json, :status => :unprocessable_entity
    end
  end

  def delete_experience
    @experience.status = Experience::DELETED
    
    if @experience.save
      json = {}
      json[:id] = @experience.id
      render :json => json
    else
      flash[:error] = 'No se pudo eliminar la experiencia'
      json = {}
      json[:flash] = flash
      json[:errors] = @experience.errors
      render :json => json, :status => :unprocessable_entity
    end
  end


  def add_experience
    @person = Person.find(params[:person_id])
    @experience = @person.experiences.new
    @experience.title              = params[:title]
    @experience.experience_type_id = params[:experience_type]
    @experience.company            = params[:company]
    @experience.description        = params[:description]
    @experience.location           = params[:location]
    @experience.start_date         = params[:start_date]
    @experience.end_date           = params[:end_date]
    @experience.status = Experience::ACTIVE 
    if @experience.save
      json = {}
      json[:id] = @experience.id
      json[:message] = 'Experiencia agregada'
      render :json => json
    else
      flash[:error] = 'No se pudo agregar la experiencia'
      json = {}
      json[:flash] = flash
      json[:errors] = @experience.errors
      render :json => json, :status => :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end
end