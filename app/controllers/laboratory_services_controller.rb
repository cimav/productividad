class LaboratoryServicesController < ApplicationController
  before_action :set_person

  def index
  	database = 'bitacora_development'
  	sql_bitacora_id = "SELECT id FROM #{database}.users WHERE email = '#{@person.email}'"
  	servicios_vinculacion = "1,12,14"
  	if params[:year].to_i > 0
  	  year = params[:year]
  	else
  	  year = Date.today.year
  	end
  	@filter_year = year
  	@min_year = 0
  	date_start = "#{year}-01-01 00:00:00"
    date_end = "#{year}-12-31 23:59:59"
  	rs_id = ActiveRecord::Base.connection.execute(sql_bitacora_id)
  	bitacora_user_id = 0

  	if rs_id.count == 1
  	  rs_id.each do |i|
  	  	bitacora_user_id = i[0]
  	  end

  	  sql_min_year = "SELECT MIN(YEAR(created_at)) FROM #{database}.requested_service_technicians WHERE user_id = #{bitacora_user_id}"
  	  rs_min = ActiveRecord::Base.connection.execute(sql_min_year)
  	  rs_min.each do |i|
  	  	@min_year = i[0]
  	  end
    
  	  sql = "SELECT
               requested_services.number AS identificador,
               CONVERT_TZ(log.created_at,'+00:00','-7:00') AS fecha,
               laboratories.name AS laboratorio,
               laboratory_services.name AS servicio,
               samples.quantity AS cantidad,
               laboratory_services.is_catalog AS es_vinculacion,
               IF(laboratory_services.is_catalog = 1, IFNULL(laboratory_services.sale_price, 0), (IFNULL(IFNULL(costo_tecnicos,0),0) + IFNULL(IFNULL(costo_equipos,0),0) + IFNULL(IFNULL(costo_otros,0),0)) * 1.1726 * 1.4 ) AS monto, 
               requested_service_technicians.participation AS porcentaje,
               IF(is_catalog=1, ((samples.quantity * sale_price) / 2) / (100 / participation), ((IFNULL(costo_tecnicos,0) + IFNULL(costo_equipos,0) + IFNULL(costo_otros,0)) * 1.1726 * 1.4)  / (100 / participation) ) AS considerar
            FROM
              #{database}.requested_services
              LEFT JOIN #{database}.samples ON samples.id = sample_id
              LEFT JOIN #{database}.service_requests ON service_requests.id = samples.service_request_id
              LEFT JOIN #{database}.laboratory_services ON laboratory_services.id = requested_services.laboratory_service_id
              LEFT JOIN #{database}.laboratories ON laboratories.id = laboratory_id
              LEFT JOIN #{database}.requested_service_technicians ON requested_service_technicians.requested_service_id = requested_services.id
              LEFT JOIN (SELECT * FROM #{database}.activity_logs WHERE requested_service_status = 99 GROUP BY requested_service_id) log ON log.requested_service_id = requested_services.id
              LEFT JOIN (SELECT requested_service_id, IFNULL(SUM(hours * hourly_wage),0) AS costo_tecnicos FROM #{database}.requested_service_technicians GROUP BY requested_service_id) horas_hombre ON horas_hombre.requested_service_id = requested_services.id
              LEFT JOIN (SELECT requested_service_id, IFNULL(SUM(hours * hourly_rate),0) AS costo_equipos FROM #{database}.requested_service_equipments GROUP BY requested_service_id) horas_eq ON horas_eq.requested_service_id = requested_services.id
              LEFT JOIN (SELECT requested_service_id, IFNULL(SUM(price),0) AS costo_otros FROM #{database}.requested_service_others GROUP BY requested_service_id) costo_otros ON costo_otros.requested_service_id = requested_services.id
            WHERE
              requested_service_technicians.user_id = #{bitacora_user_id}
              AND requested_services.status = 99
              AND (log.created_at >= '#{date_start}' AND log.created_at <= '#{date_end}')  AND requested_services.created_at <= '#{date_end}'
              AND service_requests.request_type_id NOT IN(#{servicios_vinculacion})
            ORDER BY
              requested_services.created_at"
      @laboratory_services = ActiveRecord::Base.connection.execute(sql)
      render layout: 'profile'
    else 
      puts "Error"
    end
     
  end

  private
    def set_person
      email = params[:email]
      if !email.include? '@'
        email += '@' + main_organization.domain
      end
      @person = Person.find_by_email(email)
      puts email
      if (!@person) 
        #redirect_to profiles_url
        puts "REDIRECT"
      end
    end
end







