# Dinub API

This README documents the steps necessary to get the
API up and running.

## Heroku Backend

### https://dinub-api.herokuapp.com/

Sample GET Requests:

* https://dinub-api.herokuapp.com/items
* https://dinub-api.herokuapp.com/users/1/balance
* https://dinub-api.herokuapp.com/users/1/statement
* https://dinub-api.herokuapp.com/companies/1/balance
* https://dinub-api.herokuapp.com/companies/1/statement

## Example Requests on Postman

You can make petitions to our API using Postman. Here a helper collection that you can download by following these steps:

1. File
2. Import
3. Import From Link
4. Enter https://www.getpostman.com/collections/0af88216b51670f1e1e8
5. Import

## Endpoints



| Verb        | URI Pattern | Controller and Action  |
| ------------- |-------------|----------|
| POST |     /cart_items(.:format) |                           cart_items#create {:format=>:json} |
| PATCH |    /cart_items/:id(.:format) |                       cart_items#update {:format=>:json} |
| PUT |      /cart_items/:id(.:format) |                       cart_items#update {:format=>:json} |
| DELETE |   /cart_items/:id(.:format) |                       cart_items#destroy {:format=>:json} |
| GET |      /items(.:format) |                                items#index {:format=>:json} |
| GET |      /items/:id(.:format) |                            items#show {:format=>:json} |
| GET |      /companies/:id/balance(.:format) |                companies#balance {:format=>:json} |
| GET |      /companies/:id/statement(.:format) |              companies#statement {:format=>:json} |
| GET |      /companies/:id/open_tabs(.:format) |              companies#open_tabs {:format=>:json} |
| GET |      /companies/:id/client_cart/:user_id(.:format) |   companies#client_cart {:format=>:json} |
| POST |     /companies/:id/debit_user/:user_id(.:format) |    companies#debit_user {:format=>:json} |
| GET |      /companies(.:format) |                            companies#index {:format=>:json} |
| POST |     /companies(.:format) |                            companies#create {:format=>:json} |
| GET |      /companies/:id(.:format) |                        companies#show {:format=>:json} |
| PATCH |    /companies/:id(.:format) |                        companies#update {:format=>:json} |
| PUT |      /companies/:id(.:format) |                        companies#update {:format=>:json} |
| DELETE |   /companies/:id(.:format) |                        companies#destroy {:format=>:json} |
| GET |      /users/:id/balance(.:format) |                    users#balance {:format=>:json} |
| GET |      /users/:id/statement(.:format) |                  users#statement {:format=>:json} |
| GET |      /users/:id/open_tabs(.:format) |                  users#open_tabs {:format=>:json} |
| GET |      /users/:id/cart_at/:company_id(.:format) |        users#cart {:format=>:json} |
| POST |     /users/:id/credit_company/:company_id(.:format) | users#credit_company {:format=>:json} |
| GET |      /users(.:format) |                                users#index {:format=>:json} |
| GET |      /users/:id(.:format) |                            users#show {:format=>:json} |
| PATCH |    /users/:id(.:format) |                            users#update {:format=>:json} |
| PUT |      /users/:id(.:format) |                            users#update {:format=>:json} |
| DELETE |   /users/:id(.:format) |                            users#destroy {:format=>:json} |
| POST |     /transfers(.:format) |                            transfers#create {:format=>:json} |
| GET |      /auth/sign_in(.:format) |                         devise_token_auth/sessions#new |
| POST |     /auth/sign_in(.:format) |                         devise_token_auth/sessions#create |
| DELETE |   /auth/sign_out(.:format) |                        devise_token_auth/sessions#destroy |
| GET |      /auth/password/new(.:format) |                    devise_token_auth/passwords#new |
| GET |      /auth/password/edit(.:format) |                   devise_token_auth/passwords#edit |
| PATCH |    /auth/password(.:format) |                        devise_token_auth/passwords#update |
| PUT |      /auth/password(.:format) |                        devise_token_auth/passwords#update |
| POST |     /auth/password(.:format) |                        devise_token_auth/passwords#create |
| GET |      /auth/cancel(.:format) |                          devise_token_auth/registrations#cancel |
| GET |      /auth/sign_up(.:format) |                         devise_token_auth/registrations#new |
| GET |      /auth/edit(.:format) |                            devise_token_auth/registrations#edit |
| PATCH |    /auth(.:format) |                                 devise_token_auth/registrations#update |
| PUT |      /auth(.:format) |                                 devise_token_auth/registrations#update |
| DELETE |   /auth(.:format) |                                 devise_token_auth/registrations#destroy |
| POST |     /auth(.:format) |                                 devise_token_auth/registrations#create |
| GET |      /auth/validate_token(.:format) |                  devise_token_auth/token_validations#validate_token |
| GET |      /auth/failure(.:format) |                         devise_token_auth/omniauth_callbacks#omniauth_failure |
| GET |      /auth/:provider/callback(.:format) |              devise_token_auth/omniauth_callbacks#omniauth_success |
| GET ||POST /omniauth/:provider/callback(.:format) |          devise_token_auth/omniauth_callbacks#redirect_callbacks |
| GET ||POST /omniauth/failure(.:format) |                     devise_token_auth/omniauth_callbacks#omniauth_failure |
| GET |      /auth/:provider(.:format) |                       redirect(301) |
| POST |     /create_qr_code(.:format) |                       qr#create_qr_code |

## iOS Application

https://github.com/noeldelgadom/sbc_fintech_hackathon_ios

## Support

noeldelgadom@gmail.com
