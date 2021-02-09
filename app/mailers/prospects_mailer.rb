class ProspectsMailer < ApplicationMailer
  def new_prospect(prospect)
    @prospect = prospect
    to_people = []
    if Rails.env.production? 
      Department.where(is_scientific: true).order(:name).each do |department|
        to_people << department.person.email
      end
    else 
      to_people << ENV['EMAIL_DEVELOPER']
    end

    mail(to: to_people, subject: "[SIP] Nuevo prospecto #{prospect.code}.")
  end
end
