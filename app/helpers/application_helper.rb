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

  def is_journal_admin?
    current_user_roles.include?('JOURNALS')
  end

  def is_conference_admin?
    current_user_roles.include?('CONFERENCES')
  end

  def is_association_admin?
    current_user_roles.include?('ASSOCIATIONS')
  end

  def custom_icon(color, icon, text)
    t = '<div class="base-icon">
         <div class="icon TEMPLATE-CLASS"><i class="fas TEMPLATE-ICON" aria-hidden="true"></i></div>
         <div class="base-label TEMPLATE-BG">TEMPLATE-TEXT</div>
         </div>'
    t.sub! 'TEMPLATE-CLASS', "has-text-#{color}"
    t.sub! 'TEMPLATE-ICON', icon
    t.sub! 'TEMPLATE-TEXT', text
    t.sub! 'TEMPLATE-BG', "has-background-#{color}"

    t.html_safe
  end

  def doc_icon
    custom_icon('light', 'fa-file', '&nbsp')
  end


  def published_icon
    custom_icon('success', 'fa-check', 'Publicado')
  end

  def accepted_icon
    custom_icon('link', 'fa-thumbs-up', 'Aceptado')
  end

  def sent_icon
    custom_icon('primary', 'fa-paper-plane', 'Enviado')
  end

  def rejected_icon
    custom_icon('danger', 'fa-times', 'Rechazado')
  end

end
