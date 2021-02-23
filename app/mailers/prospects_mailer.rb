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

    mail(to: to_people, subject: "[VINCULACIÓN] 📢 Nuevo Prospecto de Proyecto #{prospect.code}.")
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
        if team.participant_type.to_i != ProspectTeam::NOT_PARTICIPANT
          to_people << team.person.email
        end
      end
    else 
      to_people << ENV['EMAIL_DEVELOPER']
    end

    mail(to: to_people, subject: "[VINCULACIÓN] Equipo asignado al Prospecto de Proyecto #{prospect.code}.")
  end
end
