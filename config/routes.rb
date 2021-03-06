# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace 'api' do
    namespace 'v1' do
      post 'transactions', to: 'transactions#create'
      get 'transactions', to: 'transactions#index'
      get 'transactions/:id', to: 'transactions#show'
      patch 'transactions', to: 'transactions#update'
    end
  end
end
