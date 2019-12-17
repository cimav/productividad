class ProfilesController < ApplicationController
  before_action :set_person, only: [:edit, :edit_save] 

  
  def index
  end

  def my_profile
  	redirect_to action: "show", email: current_user.email.split("@").first 
  end

  def show
    email = params[:email]
    if !email.include? '@'
      email += '@' + main_organization.domain
    end
    @person = Person.find_by_email(email)
    render :layout => 'profile'
  end

  def edit
    render :layout => 'profile'
  end

  def edit_save
    if @person.update(person_params)
      redirect_to profile_edit_path(@person.shortname), notice: 'Perfil actualizado'
    else 
      redirect_to profile_edit_path(@person.shortname), notice: 'No se pudo actualizar el perfil'
    end
  end

  private
    def set_person
      email = params[:email]
      if !email.include? '@'
        email += '@' + main_organization.domain
      end
      @person = Person.find_by_email(email)

      if (!@person) 
        redirect_to profiles_url
      end
    end

    def person_params
      params.require(:person).permit(:about)
    end

end
