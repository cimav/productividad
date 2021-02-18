class ProspectsMailer < ApplicationMailer
  def new_prospect(prospect)
    @prospect = prospect
    to_people = []
    if Rails.env.production? 
      evals = Person.left_outer_joins(:person_roles).left_outer_joins(:roles).where('roles.IDENTIFICATOR': 'PROSPECT_EVALUATOR') 
      evals.each do |p|
        to_people << p.email
      end
    else 
      to_people << ENV['EMAIL_DEVELOPER']
    end

    mail(to: to_people, subject: "[SIP] Nuevo prospecto #{prospect.code}.")
  end

  def team_created(prospect)
    @prospect = prospect
    to_people = []
    if Rails.env.production? 
      evals = Person.left_outer_joins(:person_roles).left_outer_joins(:roles).where('roles.IDENTIFICATOR': 'PROSPECT_EVALUATOR') 
      evals.each do |p|
        to_people << p.email
      end
      @prospect.prospect_teams.order(:participant_type).each do |team| 
        to_people << team.person.email
      end
    else 
      to_people << ENV['EMAIL_DEVELOPER']
    end

    mail(to: to_people, subject: "[SIP] Equipo asignado al prospecto #{prospect.code}.")
  end
end
