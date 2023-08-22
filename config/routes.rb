# frozen_string_literal: true

# == Route Map
#
#             Prefix Verb URI Pattern                   Controller#Action
#  static_pages_home GET  /static_pages/home(.:format)  static_pages#home
#  static_pages_help GET  /static_pages/help(.:format)  static_pages#help
# static_pages_about GET  /static_pages/about(.:format) static_pages#about
#               root GET  /                             static_pages#home

Rails.application.routes.draw do
  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#home"
end
