module ApplicationHelper

  def authenticated?
    if session[:user_auth].blank?

      person = Person.where(email: session[:user_email], status: Person::STATUS_ACTIVE).first

      session[:user_auth] = person && person.email == session[:user_email]
      if session[:user_auth]
        session[:person_id] = person.id
      end
    else
      session[:user_auth]
    end
  end

  def current_user
    @current_user ||= Person.find(session[:person_id]) if session[:person_id]
  end

  def current_user_roles
    @current_user_roles ||= @current_user.roles.pluck(:identificator)
  end

  def main_organization
    @main_organization ||= Organization.find_by_domain(current_user.email.split("@").last)
  end

  def is_admin?
  	current_user_roles.include?('ADMIN')
  end

  def is_agreement_admin?
  	current_user_roles.include?('AGREEMENT')
  end

  def is_service_admin?
  	current_user_roles.include?('SERVICE')
  end

  def is_journals_admin?
    current_user_roles.include?('JOURNALS')
  end

end
