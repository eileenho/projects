Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :contacts, only: [:index]
  end

  resources :contacts, only: [:create, :destroy, :show, :update]
  resources :contact_shares, only: [:create, :destroy]

  # get     'users/:id' => 'users#show'
  # get     'users' => 'users#index'
  # patch   'users/:id' => 'users#update'
  # put     'users/:id' => 'users#update'
  # delete  'users/:id' => 'users#destroy'
  # post    'users' => 'users#create'
  # get     'users/new' => 'users#new', :as => 'new_user'
  # get     'users/:id/edit' => 'users#edit', :as => 'edit_user'
end
