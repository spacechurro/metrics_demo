Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :sessions
  resources :two_factor_auths
  resources :accounts
end
