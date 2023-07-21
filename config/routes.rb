# frozen_string_literal: true

Rails.application.routes.default_url_options[:host] = ENV['BASE_URL']

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :plants, only: %i[show create index]
      resources :users, only: :create do
        resources :user_plants, only: %i[create update destroy]
      end
    end
  end
end
