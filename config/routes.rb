Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :messages do
    collection do
      get '/sent', to: 'messages#sent'
      get '/favorites', to: 'messages#favorites'
    end
    member do
      patch '/fav', to: 'messages#fav'
    end
  end
end
