# frozen_string_literal: true

Rails.application.routes.draw do
  root 'positions#index'
  resources :users, only: [:show]

  resources :positions, except: %i[new edit]
  resources :candidates, except: %i[new edit]
  resources :recruiters, except: %i[new edit]
  resources :skills, except: %i[new edit]
  resources :position_skills, except: %i[new edit]
  resources :interviews, except: %i[new edit]
end
