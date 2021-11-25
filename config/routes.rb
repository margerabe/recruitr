Rails.application.routes.draw do

  root 'positions#index'

  resources :positions, except: [:new, :edit]
  resources :candidates, except: [:new, :edit]
  resources :recruiters, except: [:new, :edit]
  resources :skills, except: [:new, :edit]
  resources :position_skills, except: [:new, :edit]
  resources :interviews, except: [:new, :edit]

end
