Rails.application.routes.draw do
  root 'profiles#index'
  
  resources :profiles, only: [:index, :show, :new, :create, :edit, :update]

end
