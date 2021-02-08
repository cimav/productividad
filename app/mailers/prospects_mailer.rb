class ProspectsMailer < ApplicationMailer
  def new_prospect(prospect)
    @prospect = prospect
    to_people = []
    #Department.where(is_scientific: true).order(:name).each do |department|
    #  to_people << department.person.email
    #end

    to_people << 'ion@cimav.edu.mx'

    mail(to: to_people, subject: "[SIP] Nuevo prospecto #{prospect.code}.")
  end
end
