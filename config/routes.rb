Rails.application.routes.draw do
  resources :categories
  get 'welcome/index'
  get '/inicio', to:'welcome#index'
  resources :patientlists

  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
