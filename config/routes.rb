Rails.application.routes.draw do
  root 'profiles#new'

  resources :profiles, only: [:new, :create, :edit, :update]

end
