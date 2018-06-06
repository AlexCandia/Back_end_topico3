Rails.application.routes.draw do
  namespace 'api' do
      namespace 'v1' do
		resources :alumno
        resources :curso
        resources :profesor_curso
        resources :profesor
        resources :alumno_curso
        resources :contenido
        resources :evaluacion #do
            #get "notacurso" # generate  get "/products/most_popular"
        #end
        resources :usuario
        post '/logear' => 'usuario#logear', as: 'logear'
        get '/notacurso' => 'evaluacion#notacurso', as: 'notacurso'
        get '/ListaAlumnos' => 'curso#ListaAlumnos', as: 'ListaAlumnos'
        resources :contenido_curso,
        headers: :any,
        methods: [:get, :post, :put, :patch, :destroy, :options, :head]
      end
  end
end
