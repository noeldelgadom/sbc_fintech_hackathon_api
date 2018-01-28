Rails.application.routes.draw do
  resources :cart_items,  defaults: {format: :json}, only: [:create, :update, :destroy]
  resources :items,       defaults: {format: :json}, only: [:index, :show]
  resources :companies,   defaults: {format: :json} do
    member do
      get   :balance, :statement, :open_tabs
      get   'client_cart/:user_id',       to: 'companies#client_cart'
      post  'debit_user/:user_id',        to: 'companies#debit_user'
    end
  end
  resources :users,     defaults: {format: :json}, except: [:create] do
    member do
      get   :balance, :statement, :open_tabs
      get   'cart_at/:company_id',        to: 'users#cart'
      post  'credit_company/:company_id', to: 'users#credit_company'
    end
  end
  post    'transfers',  defaults: {format: :json}, to: 'transfers#create'
  mount_devise_token_auth_for 'User', at: 'auth'
  post '/create_qr_code', to: 'qr#create_qr_code'
end
