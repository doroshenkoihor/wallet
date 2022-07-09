Rails.application.routes.draw do
  resource :session, only: %i[new show create destroy]
  resources :users, only: %i[index show new create edit update destroy]
  resources :spendings, only: %i[index show new create edit update destroy]
  root 'spendings#index'
end
