Rails.application.routes.draw do
  # -------------------------------------------------
  # Config Routes
  # -------------------------------------------------
  scope 'configuracion' do
    scope(:path_names => { :new => "nuevo", :edit => "editar" }) do
      resources :indexers, :path => 'indices'
      resources :journal_categories, :path => 'categorias-de-revistas'
      resources :people, :path => 'personas'
      resources :person_types, :path => 'tipos-de-personas'
      resources :departments, :path => 'departamentos'
      resources :research_groups, :path => 'grupos-de-investigacion' do
        resources :research_sub_groups, :path => 'subgrupos'
      end
      resources :organizations, :path => 'organizaciones'
      resources :cities, :path => 'ciudades'
      resources :countries, :path => 'paises'
      resources :research_lines, :path => 'lineas-de-investigacion'
      resources :working_groups, :path => 'grupos-de-trabajo' do
        resources :working_group_members, :path => 'participantes'
        get 'participantes/muestra/:year' => 'working_group_members#index'
        resources :working_group_roles, :path => 'roles'
      end
    end
  end 

  # -------------------------------------------------
  # Gantt API
  # -------------------------------------------------
  scope '/gantt-api/:project_id' do
    get "/data", :to => "gantt#data"

    post "/task", :to => "gantt_tasks#add"
    put "/task/:id", :to => "gantt_tasks#update"
    delete "/task/:id", :to => "gantt_tasks#delete"

    post "/link", :to => "gantt_links#add"
    put "/link/:id", :to => "gantt_links#update"
    delete "/link/:id", :to => "gantt_links#delete"
  end

  
  # -------------------------------------------------
  # General Routes
  # -------------------------------------------------
  get '/configuracion' => 'config#index', as:'config'
  get '/reportes' => 'reports#index', as:'reports'
  get '/perfiles/' => 'profiles#index', as:'profiles'


  # -------------------------------------------------
  # Admin Routes
  # -------------------------------------------------
  scope format: false, constraints: { email: /.+/ } do
    scope(:path_names => { :new => "nuevo", :edit => "editar" }) do
      scope '/perfiles/:email' do
        resources :projects, :path => 'proyectos' do 
          resources :project_messages, :path => 'administrar/mensajes'

          get 'administrar/participantes/porcentajes' => 'project_participants#percentages'
          post 'administrar/participantes/porcentajes/guardar' => 'project_participants#percentages_save'
          resources :project_participants, :path => 'administrar/participantes'
          
          get 'administrar/tareas/nueva-lista' => 'project_tasks#new_list'
          get 'administrar/tareas/listas' => 'project_tasks#task_lists'
          resources :project_tasks, :path => 'administrar/tareas' do
            member do
              post 'marcar' => 'project_tasks#mark'
            end
          end
          post 'administrar/tareas/nueva-lista/guardar' => 'project_tasks#new_list_save'

          resources :project_documents, :path => 'administrar/documentos' do
            member do
              get 'nueva-carpeta' => 'project_documents#new_folder'
              post 'nueva-carpeta-guardar' => 'project_documents#save_new_folder'
              get 'nuevo-documento' => 'project_documents#new_document'
              post 'nuevo-documento-guardar' => 'project_documents#save_new_document'
              post 'subir-archivos' => 'project_documents#upload_files'
              get 'nuevo-google' => 'project_documents#new_google'
              post 'nuevo-google-guardar' => 'project_documents#save_new_google'
              post 'reemplazar-archivo' => 'project_documents#replace_file'
            end
          end

          member do
            get 'administrar' => 'projects#admin'
            get 'administrar/informacion' => 'projects#information'
            get 'administrar/informacion/editar' => 'projects#edit'
            get 'administrar/informacion/cambiar-estado' => 'projects#change_status'
            post 'administrar/informacion/cambiar-estado-guardar' => 'projects#change_status_save'
            get 'administrar/presupuesto' => 'projects#budget'
            get 'administrar/calendario' => 'gantt#index'
            get 'administrar/servicios' => 'projects#services'
          end
        end


        resources :journal_articles, :path => 'articulos-en-revistas'
        resources :conference_papers, :path => 'articulos-en-conferencias'
        resources :conference_works, :path => 'trabajos'
        resources :books, :path => 'libros'
        resources :patents, :path => 'patentes'
        resources :invited_conferences, :path => 'conferencias-por-invitacion'
        resources :event_organizers, :path => 'organizador-de-eventos'
        resources :association_members, :path => 'asociaciones-y-redes'
        resources :awards, :path => 'reconocimientos'
        resources :project_reviewers, :path => 'evaluador-de-proyectos'
        resources :journal_article_reviewers, :path => 'evaluador-de-articulos'
        resources :popular_sciences, :path => 'difusion-y-divulgacion'
        resources :relevant_activities, :path => 'actividades-relevantes'

        resources :prospects, :path => 'prospectos' do 
          resources :prospect_participants, :path => 'participantes'
          member do
            get 'definir-equipo' => 'prospects#assign'
            post 'definir-equipo' => 'prospects#create_team'
            get 'cambiar-estado' => 'prospects#change_status'
            post 'cambiar-estado-guardar' => 'prospects#change_status_save'
          end
        end

        get 'editar' => 'profiles#edit', as: 'profile_edit'
        patch 'guardar' => 'profiles#edit_save', as: 'profile_edit_save'

        get 'proyectos/muestra/:status/:year' => 'projects#index'
        get 'proyectos/muestra/:status' => 'projects#index'
        get 'articulos-en-revistas/muestra/:status/:year' => 'journal_articles#index'
        get 'articulos-en-revistas/muestra/:status' => 'journal_articles#index'
        get 'articulos-en-conferencias/muestra/:status/:year' => 'conference_papers#index'
        get 'articulos-en-conferencias/muestra/:status' => 'conference_papers#index'
        get 'libros/muestra/:status/:year' => 'books#index'
        get 'libros/muestra/:status' => 'books#index'
        get 'trabajos/muestra/:status/:year' => 'conference_works#index'
        get 'trabajos/muestra/:status' => 'conference_works#index'
        get 'patentes/muestra/:status/:year' => 'patents#index'
        get 'patentes/muestra/:status' => 'patents#index'
        get 'conferencias-por-invitacion/muestra/:year' => 'invited_conferences#index'
        get 'organizador-de-eventos/muestra/:year' => 'event_organizers#index'
        get 'asociaciones-y-redes/muestra/:year' => 'association_members#index'
        get 'reconocimientos/muestra/:year' => 'awards#index'
        get 'evaluador-de-proyectos/muestra/:year' => 'project_reviewers#index'
        get 'evaluador-de-articulos/muestra/:year' => 'journal_article_reviewers#index'
        get 'difusion-y-divulgacion/muestra/:year' => 'popular_sciences#index'
        get 'actividades-relevantes/muestra/:year' => 'relevant_activities#index'

        get 'grupos-de-trabajo/' => 'person_working_groups#index'
        get 'grupos-de-trabajo/muestra/:year' => 'person_working_groups#index'

        get 'servicios-de-laboratorio/' => 'laboratory_services#index'
        get 'servicios-de-laboratorio/muestra/:year' => 'laboratory_services#index'
      end
    end
  end

  get  'experiencia/ui/:person_id' => 'experiences#ui'
  get  'experiencia/editar/:person_id/:experience_id' => 'experiences#edit'
  post 'experiencia/actualiza' => 'experiences#update_experience'
  post 'experiencia/elimina' => 'experiences#delete_experience'
  post 'experiencia/agrega' => 'experiences#add_experience'

  get  'educacion/ui/:person_id' => 'education#ui'
  get  'educacion/editar/:person_id/:education_id' => 'education#edit'
  post 'educacion/actualiza' => 'education#update_education'
  post 'educacion/elimina' => 'education#delete_education'
  post 'educacion/agrega' => 'education#add_education'

  get  'areas-de-interes/buscar' => 'topics#search'
  get  'areas-de-interes-por-persona/ui/:person_id' => 'person_topics#ui'
  get  'areas-de-interes-por-persona/lista/:person_id' => 'person_topics#topic_list'
  post 'areas-de-interes-por-persona/elimina' => 'person_topics#delete_topic'
  post 'areas-de-interes-por-persona/agrega' => 'person_topics#add_topic'


  get  'lineas-de-investigacion-por-persona/ui/:person_id' => 'person_research_lines#ui'
  post 'lineas-de-investigacion-por-persona/elimina' => 'person_research_lines#delete_research_line'
  post 'lineas-de-investigacion-por-persona/agrega' => 'person_research_lines#add_research_line'


  get  'participantes/ui/:product_class/:product_id' => 'product_participants#ui'
  get  'participantes/select/:participant_id/:type_id' => 'product_participants#participant_select'
  post 'participantes/actualiza' => 'product_participants#update_participant'
  post 'participantes/elimina' => 'product_participants#delete_participant'
  post 'participantes/agrega' => 'product_participants#add_participant'

  get  'agradecimientos/ui/:product_class/:product_id' => 'acknowledgments#ui'
  get  'agradecimientos/select/:type_id' => 'acknowledgments#person_select'
  post 'agradecimientos/elimina' => 'acknowledgments#delete_acknowledgment'
  post 'agradecimientos/agrega' => 'acknowledgments#add_acknowledgment'

  get  'citas/ui/:product_class/:product_id' => 'product_cites#ui'
  get  'citas/nueva/:product_class/:product_id' => 'product_cites#new'
  post 'citas/elimina' => 'product_cites#delete_cite'
  post 'citas/agrega' => 'product_cites#add_cite'
  get  'citas/editar/:id' => 'product_cites#edit_cite'
  post 'citas/actualiza' => 'product_cites#update_cite'

  resources :product_files, :path => 'archivos-producto'
  get 'archivos-producto/ui/:product_class/:product_id' => 'product_files#ui'
  get 'archivos-producto/descarga/:id' => 'product_files#download'
  post 'archivos-producto/elimina' => 'product_files#delete_file'


  get '/revistas/buscar' => 'journals#search'
  get '/revistas/datos/:id' => 'journals#data'
  get '/revistas/nueva' => 'journals#new_journal'
  post '/revistas/agregar-nueva' => 'journals#add_journal'

  get '/conferencias/buscar' => 'conferences#search'
  get '/conferencias/datos/:id' => 'conferences#data'
  get '/conferencias/nueva' => 'conferences#new_conference'
  post '/conferencias/agregar-nueva' => 'conferences#add_conference'

  get '/asociaciones/buscar' => 'associations#search'
  get '/asociaciones/datos/:id' => 'associations#data'
  get '/asociaciones/nueva' => 'associations#new_association'
  post '/asociaciones/agregar-nueva' => 'associations#add_association'


  scope(:path_names => { :new => "nuevo", :edit => "editar" }) do
    resources :conferences, :path => 'conferencias'
    resources :associations, :path => 'asociaciones'
    resources :journals, :path => 'revistas' do
      scope(:path_names => { :new => "nuevo", :edit => "editar" }) do
        resources :journal_impact_factors, :path => 'factor-de-impacto'
        resources :journal_journal_categories, :path => 'categorias'
      end
    end
     
  end

  # -------------------------------------------------
  # ORG Routes
  # -------------------------------------------------
  get '/departamentos/' => 'departments#list'
  get '/departamentos/:id' => 'departments#department_show', :as => :ver_departamento

  get '/proyectos/' => 'projects#org_index'
  get '/proyectos/muestra/:status/:year' => 'projects#org_index'
  get '/proyectos/muestra/:status' => 'projects#org_index'
  get '/proyectos/:id' => 'projects#show', :as => :ver_proyecto

  get '/articulos-en-revistas/' => 'journal_articles#org_index'
  get '/articulos-en-revistas/muestra/:status/:year' => 'journal_articles#org_index'
  get '/articulos-en-revistas/muestra/:status' => 'journal_articles#org_index'
  get '/articulos-en-revistas/:id' => 'journal_articles#show', :as => :ver_articulo_en_revista

  get '/articulos-en-conferencias/' => 'conference_papers#org_index'
  get '/articulos-en-conferencias/muestra/:status/:year' => 'conference_papers#org_index'
  get '/articulos-en-conferencias/muestra/:status' => 'conference_papers#org_index'
  get '/articulos-en-conferencias/:id' => 'conference_papers#show', :as => :ver_articulo_en_conferencia

  get '/difusion-y-divulgacion/' => 'popular_sciences#org_index'
  get '/difusion-y-divulgacion/muestra/:year' => 'popular_sciences#org_index'
  get '/difusion-y-divulgacion/:id' => 'popular_sciences#show', :as => :ver_difusion_y_divulgacion

  get '/libros' => 'books#org_index'
  get '/libros/muestra/:status/:year' => 'books#org_index'
  get '/libros/muestra/:status' => 'books#org_index'
  get '/libros/:id' => 'books#show', :as => :ver_libro

  get '/trabajos' => 'conference_works#org_index'
  get '/trabajos/muestra/:status/:year' => 'conference_works#org_index'
  get '/trabajos/muestra/:status' => 'conference_works#org_index'
  get '/trabajos/:id' => 'conference_works#show', :as => :ver_trabajo

  get '/patentes' => 'patents#org_index'
  get '/patentes/muestra/:status/:year' => 'patents#org_index'
  get '/patentes/muestra/:status' => 'patents#org_index'
  get '/patentes/:id' => 'patents#show', :as => :ver_patente

  get '/conferencias-por-invitacion' => 'invited_conferences#org_index'
  get '/conferencias-por-invitacion/muestra/:status/:year' => 'invited_conferences#org_index'
  get '/conferencias-por-invitacion/muestra/:status' => 'invited_conferences#org_index'
  get '/conferencias-por-invitacion/:id' => 'invited_conferences#show', :as => :ver_conferencia_por_invitacion

  get '/asociaciones-y-redes' => 'association_members#org_index'
  get '/asociaciones-y-redes/muestra/:status/:year' => 'association_members#org_index'
  get '/asociaciones-y-redes/muestra/:status' => 'association_members#org_index'
  get '/asociaciones-y-redes/:id' => 'association_members#show', :as => :ver_miembro_asociacion

  get '/reconocimientos' => 'awards#org_index'
  get '/reconocimientos/muestra/:status/:year' => 'awards#org_index'
  get '/reconocimientos/muestra/:status' => 'awards#org_index'
  get '/reconocimientos/:id' => 'awards#show', :as => :ver_reconocimiento

  get '/organizador-de-eventos' => 'event_organizers#org_index'
  get '/organizador-de-eventos/muestra/:status/:year' => 'event_organizers#org_index'
  get '/organizador-de-eventos/muestra/:status' => 'event_organizers#org_index'
  get '/organizador-de-eventos/:id' => 'event_organizers#show', :as => :ver_organizador

  get '/evaluador-de-proyectos' => 'project_reviewers#org_index'
  get '/evaluador-de-proyectos/muestra/:status/:year' => 'project_reviewers#org_index'
  get '/evaluador-de-proyectos/muestra/:status' => 'project_reviewers#org_index'
  get '/evaluador-de-proyectos/:id' => 'project_reviewers#show', :as => :ver_evaluador_de_proyecto

  get '/evaluador-de-articulos' => 'journal_article_reviewers#org_index'
  get '/evaluador-de-articulos/muestra/:status/:year' => 'journal_article_reviewers#org_index'
  get '/evaluador-de-articulos/muestra/:status' => 'journal_article_reviewers#org_index'
  get '/evaluador-de-articulos/:id' => 'journal_article_reviewers#show', :as => :ver_evaluador_de_articulo

  get '/actividades-relevantes' => 'relevant_activities#org_index'
  get '/actividades-relevantes/muestra/:status/:year' => 'relevant_activities#org_index'
  get '/actividades-relevantes/muestra/:status' => 'relevant_activities#org_index'
  get '/actividades-relevantes/:id' => 'relevant_activities#show', :as => :ver_actividad_relevante

  get '/prospectos' => 'prospects#org_index'
  get '/prospectos/muestra/:status/:year' => 'prospects#org_index'
  get '/prospectos/muestra/:status' => 'prospects#org_index'
  get '/prospectos/:id' => 'prospects#show', :as => :ver_prospecto

  # -------------------------------------------------
  # Department Routes
  # -------------------------------------------------
  get '/departamentos/:department_id/proyectos/' => 'projects#department_index', :as => :ver_departamento_proyectos
  get '/departamentos/:department_id/muestra/:status/:year' => 'projects#department_index'
  get '/departamentos/:department_id/muestra/:status' => 'projects#department_index'
  get '/departamentos/:department_id/proyectos/:id' => 'projects#show', :as => :ver_departamento_proyecto

  get '/departamentos/:department_id/prospectos/' => 'prospect#department_index', :as => :ver_departamento_prospectos
  get '/departamentos/:department_id/muestra/:status/:year' => 'prospect#department_index'
  get '/departamentos/:department_id/muestra/:status' => 'prospect#department_index'
  get '/departamentos/:department_id/prospectos/:id' => 'prospect#show', :as => :ver_departamento_prospecto


  # -------------------------------------------------
  # Profile Routes
  # -------------------------------------------------
  get '/mi-perfil' => 'profiles#my_profile', as:'my_profile'
  get '/perfiles/:email' => 'profiles#show', :constraints => { :email => /(?!.*\/).*/ }, :as => "show_profile"


  # -------------------------------------------------
  # Redirect Routes
  # -------------------------------------------------
  get '/ir-a/prospecto/*code' => 'prospects#go_to'

  # -------------------------------------------------
  # Auth Rules
  # -------------------------------------------------
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  root :to => 'home#index'
end
