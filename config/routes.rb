Rails.application.routes.draw do

  mount Homeland::Engine, at: "/homeland"
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :exams
  resources :respondents
  resources :videos

  namespace :admin, as: 'admin' do
    root 'home#index', as: 'index'
    get 'choose', to: 'choices#choose'
    resources :users
    resources :exams
    resources :choices, only: [:index]
    resources :questions
    resources :respondents
    resources :response_options, only: [:new, :create, :edit, :update]
    resources :videos

    resources :courses do
      member do
        get 'upload', to: 'courses#upload'
        patch 'upload', to: 'courses#do_upload'
        get 'resume_upload', to: 'courses#resume_upload'
        patch 'update_status', to: 'courses#update_status'
        get 'reset_upload', to: 'courses#reset_upload'
      end
    end
  end
end