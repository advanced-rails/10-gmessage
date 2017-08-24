Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :messages do
    collection do
      get '/sent', to: 'messages#sent'
    end
  end
end
