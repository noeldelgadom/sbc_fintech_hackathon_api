# Dinub API

This README documents the steps necessary to get the
application up and running.

## Endpoints

* GET      /companies(.:format)                   companies#index {:format=>:json}
* POST     /companies(.:format)                   companies#create {:format=>:json}
* GET      /companies/:id(.:format)               companies#show {:format=>:json}
* PATCH    /companies/:id(.:format)               companies#update {:format=>:json}
* PUT      /companies/:id(.:format)               companies#update {:format=>:json}
* DELETE   /companies/:id(.:format)               companies#destroy {:format=>:json}
* GET      /users(.:format)                       users#index {:format=>:json}
* GET      /users/:id(.:format)                   users#show {:format=>:json}
* PATCH    /users/:id(.:format)                   users#update {:format=>:json}
* PUT      /users/:id(.:format)                   users#update {:format=>:json}
* DELETE   /users/:id(.:format)                   users#destroy {:format=>:json}
* GET      /auth/sign_in(.:format)                devise_token_auth/sessions#new
* POST     /auth/sign_in(.:format)                devise_token_auth/sessions#create
* DELETE   /auth/sign_out(.:format)               devise_token_auth/sessions#destroy
* GET      /auth/password/new(.:format)           devise_token_auth/passwords#new
* GET      /auth/password/edit(.:format)          devise_token_auth/passwords#edit
* PATCH    /auth/password(.:format)               devise_token_auth/passwords#update
* PUT      /auth/password(.:format)               devise_token_auth/passwords#update
* POST     /auth/password(.:format)               devise_token_auth/passwords#create
* GET      /auth/cancel(.:format)                 devise_token_auth/registrations#cancel
* GET      /auth/sign_up(.:format)                devise_token_auth/registrations#new
* GET      /auth/edit(.:format)                   devise_token_auth/registrations#edit
* PATCH    /auth(.:format)                        devise_token_auth/registrations#update
* PUT      /auth(.:format)                        devise_token_auth/registrations#update
* DELETE   /auth(.:format)                        devise_token_auth/registrations#destroy
* POST     /auth(.:format)                        devise_token_auth/registrations#create
* GET      /auth/validate_token(.:format)         devise_token_auth/token_validations#validate_token
* GET      /auth/failure(.:format)                devise_token_auth/omniauth_callbacks#omniauth_failure
* GET      /auth/:provider/callback(.:format)     devise_token_auth/omniauth_callbacks#omniauth_success
* GET|POST /omniauth/:provider/callback(.:format) devise_token_auth/omniauth_callbacks#redirect_callbacks
* GET|POST /omniauth/failure(.:format)            devise_token_auth/omniauth_callbacks#omniauth_failure
