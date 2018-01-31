Rails.application.routes.draw do
  

     get 'users/new'

     resources :tutorials
     resources :users

     root 'welcome#index'
     # get 'welcome/index'
     # get 'tutorials/new', to:
     get 'welcome/index'
     get '/signup', to: 'users#new'
     get 'users/:id', to: 'users#show'
     # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
