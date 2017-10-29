Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources :works, only: :show
  resources :tags, only: [:index, :show]
end
