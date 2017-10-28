Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'conferences#home'

  get '/new', to: 'conferences#new'
  get '/manage', to: 'admins#manage'

  post '/decline', to: 'admins#decline'
  post '/remove', to: 'admins#destroy'
  post '/accept', to: 'admins#accept'

  resources :conferences
end
