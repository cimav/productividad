class ProfilesController < ApplicationController
  
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

end
