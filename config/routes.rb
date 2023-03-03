Rails.application.routes.draw do
  resources :batches


  get 'sarza/nova/:material_id', to: 'batches#new', as: 'new_batch'
  post 'sarza/nova/:material_id', to: 'batches#create'
  get 'sarza/(:material_id)', to: 'batches#index', as: 'batches'




  resources :suppliers
  resources :materials
  resources :categories





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
