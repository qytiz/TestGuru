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
    root to: 'admin/tests#index'
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
