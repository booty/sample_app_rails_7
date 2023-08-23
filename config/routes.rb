# frozen_string_literal: true

# == Route Map
#
#    Prefix Verb URI Pattern          Controller#Action
# users_new GET  /users/new(.:format) users#new
#      help GET  /help(.:format)      static_pages#help
#     about GET  /about(.:format)     static_pages#about
#   contact GET  /contact(.:format)   static_pages#contact
#      root GET  /                    static_pages#home

Rails.application.routes.draw do
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#home"
end
