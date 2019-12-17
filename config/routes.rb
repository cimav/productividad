Rails.application.routes.draw do

  resources :person_types
  scope 'configuracion' do
    scope(:path_names => { :new => "nuevo", :edit => "editar" }) do
      resources :indexers, :path => 'indices'
      resources :people
      resources :departments
      resources :organizations
      resources :cities
      resources :countries
    end
  end 

  get '/revistas/buscar' => 'journals#search'
  get '/revistas/datos/:id' => 'journals#data'
  get '/revistas/nueva' => 'journals#new_journal'
  post '/revistas/agregar-nueva' => 'journals#add_journal'

  scope(:path_names => { :new => "nuevo", :edit => "editar" }) do
    resources :journals, :path => 'revistas' do
      scope(:path_names => { :new => "nuevo", :edit => "editar" }) do
        resources :journal_impact_factors, :path => 'factor-de-impacto'
      end
    end
  end
  


  get '/configuracion' => 'config#index', as:'config'
  get '/reportes' => 'reports#index', as:'reports'

  get '/perfiles/' => 'profiles#index', as:'profiles'

  scope format: false, constraints: { email: /.+/ } do
    scope(:path_names => { :new => "nuevo", :edit => "editar" }) do
      scope '/perfiles/:email' do
        resources :journal_articles, :path => 'articulos-en-revistas'
        get 'editar' => 'profiles#edit', as: 'profile_edit'
        patch 'guardar' => 'profiles#edit_save', as: 'profile_edit_save'
        get 'articulos-en-revistas/muestra/:status/:year' => 'journal_articles#index'
        get 'articulos-en-revistas/muestra/:status' => 'journal_articles#index'
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


  get  'participantes/ui/:product_class/:product_id' => 'product_participants#ui'
  get  'participantes/select/:participant_id/:type_id' => 'product_participants#participant_select'
  post 'participantes/actualiza' => 'product_participants#update_participant'
  post 'participantes/elimina' => 'product_participants#delete_participant'
  post 'participantes/agrega' => 'product_participants#add_participant'

  get  'agradecimientos/ui/:product_class/:product_id' => 'acknowledgments#ui'
  get  'agradecimientos/select/:type_id' => 'acknowledgments#person_select'
  post 'agradecimientos/elimina' => 'acknowledgments#delete_acknowledgment'
  post 'agradecimientos/agrega' => 'acknowledgments#add_acknowledgment'

  resources :product_files, :path => 'archivos-producto'
  get 'archivos-producto/ui/:product_class/:product_id' => 'product_files#ui'
  get 'archivos-producto/descarga/:id' => 'product_files#download'
  post 'archivos-producto/elimina' => 'product_files#delete_file'



  get '/mi-perfil' => 'profiles#my_profile', as:'my_profile'
  get '/perfiles/:email' => 'profiles#show', :constraints => { :email => /(?!.*\/).*/ }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  root :to => 'home#index'
end
