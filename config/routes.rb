# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/profile'
  get 'userinfo', to: 'pages#userinfo'
  get 'postinfo', to: 'pages#postinfo'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: 'users/confirmations'
  }
  # devise_for :users, controllers: { confirmations: 'users/confirmations' }
  get '/u/:id', to: 'users#profile', as: 'user'
  resources :posts do
    resources :comments
  end
  # get 'home' to: 'pages#home'
  get 'about', to: 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # delete '/posts/:id', to: 'posts#destroy', as: 'post  '
  # Defines the root path route ("/")

  resources :users, only: %i[create update edit]
  resources :post, only: %i[create update edit destroy]
  resources :posts do
    member do
      patch 'upvote'
      patch 'downvote'
    end
  end

  get '/posts/:id/upvote', to: 'posts#upvote'
  get 'post/:id/downvote', to: 'posts#downvote'

  post '/posts/:id/like', to: 'posts#like', as: 'like_post'

  get 'mypricing', to: 'home#mypricing'
  get 'userinformation', to: 'home#userinformation'

  # stipe
  # stripe listen --forward-to localhost:3000/stripe/webhook
  post 'stripe/webhooks', to: 'stripe/webhooks#create'
  get 'pricing', to: 'stripe/checkout#pricing'
  post 'stripe/checkout', to: 'stripe/checkout#checkout'
  get 'stripe/checkout/success', to: 'stripe/checkout#success'
  get 'stripe/checkout/cancel', to: 'stripe/checkout#pricing'
  post 'stripe/billing_portal', to: 'stripe/billing_portal#create'

  # facebook login
  # user_{provider}_omniauth_authorize_path
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'
  get '/users/auth/facebook/callback', to: 'users/omniauth_callbacks#facebook'

  root 'pages#home'
end
