Rails.application.routes.draw do
     get 'sessions/new'

     get 'login/new'

     get 'users/new'

     resources :tutorial
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

     get 'tutorial', to: 'users#tutorial'
     get 'tutorial/new', to: 'tutorial#new'
     post 'tutorial/new', to: 'tutorial#create'
     get 'tutorial/own', to: 'tutorial#own'
     get 'tutorial/search', to: 'tutorial#search'
     get 'tutorial/search/result', to: 'tutorial#searchresult'
     post 'tutorial/search', to: 'tutorial#tutorial_search'
     get 'tutorial/search/:id', to: 'tutorial#tut_request'
     get 'tutorial/accept/:id/', to: 'tutorial#accept_tutee'
     get 'tutorial/reject/:id/', to: 'tutorial#reject_tutee'

     # post 'tutorial/search/result', to: 'tutorial#tut_request'

     get 'users', to: 'welcome#index'
     get 'users/:id', to: 'users#show'
     get 'users/:id/edit', to: 'users#edit'
     # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
     