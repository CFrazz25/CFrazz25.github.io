Rails.application.routes.draw do
  get 'welcome/index'

  resources :contacts
  get '/contact', to: 'contacts#index'
  resources :user_admins
  resources :admin_sessions
  get '/logout', to: 'admin_sessions#destroy'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
