# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: { sign_in: :signin, sign_out: :logout },
                     controllers: { sessions: 'user/sessions' }

  root to: 'tests#index'
  delete :logout, to: 'sessions#destroy'

  resources :tests, only: :index do
    member do
      post :start
    end
  end
  namespace :admin do
    root 'admin/tests#index'
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
  end
  resources :test_passages, only: %i[show update] do
    member do
      resources :gists, only: :create
      get :result
      post :gist
    end
  end
end
