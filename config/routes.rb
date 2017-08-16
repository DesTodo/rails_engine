Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :items do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'random#show'
      end
      resources :items, only: [:index, :show]

      # namespace :merchants do
      #   get '/find_all', to: 'search#index'
      #   get '/find', to: 'search#show'
      #   get '/random', to: 'random#show'
      # end
      # resources :merchants, only: [:index, :show]

      namespace :invoices do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'random#show'
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'random#show'
      end
      resources :invoice_items, only: [:index, :show]

# tests not passing with correction on line 29; need to investigate
      namespace :merchants do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find_all#show'
        get '/random', to: 'random#show'
      end
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resource :customers, only: [:index, :show]
    end
  end
end
