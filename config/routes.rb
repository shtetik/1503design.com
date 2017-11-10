Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources :works, only: :show
  resources :tags, only: [:index, :show]

  namespace :admin do
    root 'works#index'

    resources :works, except: [:show]
    resources :tags, except: [:show]
  end
end
