Rails.application.routes.draw do
  resources :companies, defaults: {format: :json} do
    member { get :balance, :statement }
  end
  resources :users,     defaults: {format: :json}, except: [:create] do
    member { get :balance, :statement }
  end
  post    'transfers',  defaults: {format: :json}, to: 'transfers#create'
  mount_devise_token_auth_for 'User', at: 'auth'
end
