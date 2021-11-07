Rails.application.routes.draw do
  get 'admin/login'
  post "admin/login"
  get "admin/logout"
  resources :developers
  root "developers#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
