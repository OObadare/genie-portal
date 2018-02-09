Rails.application.routes.draw do

  devise_for :users
  # , defaults: {format: :json}

  # , controllers: {
  #   sessions: 'users/sessions'
  # }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#root"

  namespace :api do
    resources :users, defaults: {format: :json}, only: [:show]
    # resources :project_data, defaults: {format: :json}, only: [:create, :show]
  end
end
