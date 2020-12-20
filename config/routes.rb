Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resource :url_mappings, only: [:create]

  get '*path', to: 'url_mappings#show'
end
