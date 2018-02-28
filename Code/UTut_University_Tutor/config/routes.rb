Rails.application.routes.draw do
     get 'sessions/new'

     get 'login/new'

     get 'users/new'

     resources :tutorials
     resources :users
     resources :sessions

     root 'welcome#index'
     # get 'welcome/index'
     # get 'tutorials/new', to:
     get 'welcome/index'
     # Format is: '/address_path_shown_in_address_bar', to: 'path_to_html#html_name'
     get '/signup', to: 'users#new'

     get '/login', to: 'sessions#login'
     post '/login', to: 'sessions#create'
     delete '/logout', to: 'sessions#destroy'

     get 'tutorials', to: 'tutorials#index'
     get 'tutorials/new', to: 'tutorials#new'
     post 'tutorials/new', to: 'tutorials#create'
     get 'tutorials/search', to: 'tutorials#search'

     post 'tutorials/search', to: 'tutorials#tutorial_search'

     get 'users', to: 'welcome#index'
     get 'users/:id', to: 'users#show'
     get 'users/:id/edit', to: 'users#edit'
     # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
     