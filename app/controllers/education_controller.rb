class EducationController < ApplicationController
  before_action :auth_required
  before_action :set_education, only: [:update_education, :delete_education]


  def ui
    @person = Person.find(params[:person_id])
    render layout: false
  end

  def edit
    @person = Person.find(params[:person_id])
    @education = Education.find(params[:education_id])
    render layout: false
  end

  def update_education 
    @education.title           = params[:title]
    @education.organization_id = params[:organization_id]
    @education.degree_id       = params[:degree_id]
    @education.faculty         = params[:faculty]
    @education.start_year      = params[:start_year]
    @education.end_year        = params[:end_year]
    @education.status = Education::ACTIVE 

    if @education.save
      json = {}
      json[:id] = @education.id
      json[:message] = 'Educación actualizada'
      render :json => json
    else
      flash[:error] = 'No se pudo actualizar la educación'
      json = {}
      json[:flash] = flash
      json[:errors] = @education.errors
      render :json => json, :status => :unprocessable_entity
    end
  end

  def delete_education
    @education.status = Education::DELETED
    
    if @education.save
      json = {}
      json[:id] = @education.id
      render :json => json
    else
      flash[:error] = 'No se pudo eliminar la educación'
      json = {}
      json[:flash] = flash
      json[:errors] = @education.errors
      puts @education.errors.full_messages
      render :json => json, :status => :unprocessable_entity
    end
  end


  def add_education
    @person = Person.find(params[:person_id])
    @education = @person.educations.new
    @education.person_id       = @person.id
    @education.title           = params[:title]
    @education.organization_id = params[:organization_id]
    @education.degree_id       = params[:degree_id]
    @education.faculty         = params[:faculty]
    @education.start_year      = params[:start_year]
    @education.end_year        = params[:end_year]
    @education.status = Education::ACTIVE 
    if @education.save
      json = {}
      json[:id] = @education.id
      json[:message] = 'Educación agregada'
      render :json => json
    else
      flash[:error] = 'No se pudo agregar la educación'
      json = {}
      json[:flash] = flash
      json[:errors] = @education.errors
      render :json => json, :status => :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end
end
