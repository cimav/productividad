Rails.application.routes.draw do

  resources :person_types
  scope 'configuracion' do
    scope(:path_names => { :new => "nuevo", :edit => "editar" }) do
      resources :indexers, :path => 'indices'
      resources :people, :path => 'personas'
      resources :departments, :path => 'departamentos'
      resources :research_groups, :path => 'grupos-de-investigacion'
      resources :research_sub_groups, :path => 'subgrupos-de-investigacion'
      resources :organizations, :path => 'organizaciones'
      resources :cities, :path => 'ciudades'
      resources :countries, :path => 'paises'
      resources :research_lines, :path => 'lineas-de-investigacion'
      resources :working_groups, :path => 'grupos-de-trabajo' do
        resources :working_group_members, :path => 'participantes'
        get 'participantes/muestra/:year' => 'working_group_members#index'
      end
      resources :working_group_roles, :path => 'roles-de-grupos-de-trabajo'
      
    end

  end 


  scope '/gantt-api/:project_id' do
    get "/data", :to => "gantt#data"

    post "/task", :to => "gantt_tasks#add"
    put "/task/:id", :to => "gantt_tasks#update"
    delete "/task/:id", :to => "gantt_tasks#delete"

    post "/link", :to => "gantt_links#add"
    put "/link/:id", :to => "gantt_links#update"
    delete "/link/:id", :to => "gantt_links#delete"
  end

  
  
  get '/configuracion' => 'config#index', as:'config'
  get '/reportes' => 'reports#index', as:'reports'

  get '/perfiles/' => 'profiles#index', as:'profiles'


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
  get '/asociaciones/nueva' => 'associations#new_conference'
  post '/asociaciones/agregar-nueva' => 'associations#add_conference'


  scope(:path_names => { :new => "nuevo", :edit => "editar" }) do
    resources :conferences, :path => 'conferencias'
    resources :associations, :path => 'asociaciones'
    resources :journals, :path => 'revistas' do
      scope(:path_names => { :new => "nuevo", :edit => "editar" }) do
        resources :journal_impact_factors, :path => 'factor-de-impacto'
      end
    end
     
  end



  get '/mi-perfil' => 'profiles#my_profile', as:'my_profile'
  get '/perfiles/:email' => 'profiles#show', :constraints => { :email => /(?!.*\/).*/ }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  root :to => 'home#index'
end
