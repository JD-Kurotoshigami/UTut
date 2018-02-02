Rails.application.routes.draw do
  

  get 'sessions/new'

  get 'login/new'

     get 'users/new'

     resources :tutorials
     resources :users

     root 'welcome#index'
     # get 'welcome/index'
     # get 'tutorials/new', to:
     get 'welcome/index'
     # Format is: '/address_path_shown_in_address_bar', to: 'path_to_html#html_name'
     get '/signup', to: 'users#new'

     get '/login', to: 'sessions#new'
     post '/login', to: 'sessions#create'
     delete '/logout', to: 'sessions#destroy'

     get 'users/:id', to: 'users#show'
     # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
