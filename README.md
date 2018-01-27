# Dinub API

This README would normally document whatever steps are necessary to get the
application up and running.

## Endpoints

* GET      /companies(.:format)                   companies#index
* POST     /companies(.:format)                   companies#create
* GET      /companies/:id(.:format)               companies#show
* PATCH    /companies/:id(.:format)               companies#update
* PUT      /companies/:id(.:format)               companies#update
* DELETE   /companies/:id(.:format)               companies#destroy
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
* GET      /auth/:provider(.:format)              redirect(301)
