class ApplicationController < ActionController::Base

  include ApplicationHelper

  def auth_required
    redirect_to '/login' unless authenticated?
  end
  
  private
    def set_department
      department_id = params[:department_id]
      return nil if department_id.blank?

      @department = Department.find(department_id)
    end

    def set_person
      email = params[:email]
      return nil if email.blank?

      if !email.include? '@'
        email += '@' + main_organization.domain
      end
      @person = Person.find_by_email(email)

      if (!@person) 
        #redirect_to profiles_url
        puts "REDIRECT"
      end
    end
end
