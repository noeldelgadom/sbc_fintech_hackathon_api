Rails.application.routes.draw do
  resources :cart_items,  defaults: {format: :json}, only: [:create, :update, :destroy]
  resources :items,       defaults: {format: :json}, only: [:index, :show]
  resources :companies,   defaults: {format: :json} do
    member do
      get :balance, :statement
      get 'client_cart/:user_id', to: 'companies#client_cart'
    end
  end
  resources :users,     defaults: {format: :json}, except: [:create] do
    member do
      get :balance, :statement
      get 'cart_at/:company_id', to: 'users#cart'
    end
  end
  post    'transfers',  defaults: {format: :json}, to: 'transfers#create'
  mount_devise_token_auth_for 'User', at: 'auth'
  post '/create_qr_code', to: 'qr#create_qr_code'
end
