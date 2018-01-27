Rails.application.routes.draw do
  resources :cart_items,  defaults: {format: :json}, only: [:create, :update, :destroy]
  resources :foods,       defaults: {format: :json}, only: [:index, :show]
  resources :beers,       defaults: {format: :json}, only: [:index, :show]
  resources :companies,   defaults: {format: :json} do
    member { get :balance, :statement }
  end
  resources :users,     defaults: {format: :json}, except: [:create] do
    member { get :balance, :statement }
  end
  post    'transfers',  defaults: {format: :json}, to: 'transfers#create'
  mount_devise_token_auth_for 'User', at: 'auth'
  post '/create_qr_code', to: 'qr#create_qr_code'
end
