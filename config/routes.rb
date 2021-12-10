Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'projects#index'
  get 'users/index', to: 'users#index'
  get 'users/new_user', to: 'users#new_user'
  post 'users/new_user', to: 'users#create_user'
  delete 'users/delete', to: 'users#destroy'
  get 'users/edit_user', to: 'users#edit_user'
  patch 'users/edit_user', to: 'users#update_user'
  get 'bugs/assign_ticket', to: 'bugs#assign_ticket'
  get 'users/developer_bugs', to: 'users#developer_bugs'
  get 'users/show', to: 'users#show'
  devise_for :users
  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  #devise_for :users, path: '', path_names: {  sign_out: 'logout'}
  resources :projects do
    resources :bugs
  end
  # post 'bug/update', to: 'bugs#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
