Rails.application.routes.draw do
  root 'profiles#new'

  resources :profiles, only: [:index, :new, :create, :edit, :update]

end
