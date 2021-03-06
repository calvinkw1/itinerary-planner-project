Rails.application.routes.draw do
  
  root 'site#index'

  get '/auth/:provider/callback', to: 'users#twitter_create'

  # get '/auth/failure', to: 'site#index'

  get '/login', to: "users#login", as: 'login'

  get '/signup', to: "users#signup", as: 'signup'

  post '/login', to: "users#login"

  post '/signup', to: "users#create"

  delete '/logout', to: "users#logout"

  resources :users
  
  resources :users do
    post '/comments' => 'comments#create', as: 'comments'
  end

  get '/destination/new', to: "destinations#new", as: 'newdest'

  resources :itineraries do
    post '/comments' => 'comments#create', as: 'comments'
  end
  
  resources :destinations do
    post '/comments' => 'comments#create', as: 'comments'
  end

  post '/destination/:id/users/new', to: 'destinations#add_companion', as: 'add_companion'
  delete '/destination/:destination_id/users/:user_id', to: 'destinations#remove_companion', as: 'remove_companion'

#           Prefix Verb   URI Pattern                      Controller#Action
#             root GET    /                                site#index
#            login GET    /login(.:format)                 users#login
#           signup GET    /signup(.:format)                users#signup
#                  POST   /login(.:format)                 users#login
#                  POST   /signup(.:format)                users#create
#           logout GET    /logout(.:format)                users#logout
#            users GET    /users(.:format)                 users#index
#                  POST   /users(.:format)                 users#create
#         new_user GET    /users/new(.:format)             users#new
#        edit_user GET    /users/:id/edit(.:format)        users#edit
#             user GET    /users/:id(.:format)             users#show
#                  PATCH  /users/:id(.:format)             users#update
#                  PUT    /users/:id(.:format)             users#update
#                  DELETE /users/:id(.:format)             users#destroy
#      itineraries GET    /itineraries(.:format)           itineraries#index
#                  POST   /itineraries(.:format)           itineraries#create
#    new_itinerary GET    /itineraries/new(.:format)       itineraries#new
#   edit_itinerary GET    /itineraries/:id/edit(.:format)  itineraries#edit
#        itinerary GET    /itineraries/:id(.:format)       itineraries#show
#                  PATCH  /itineraries/:id(.:format)       itineraries#update
#                  PUT    /itineraries/:id(.:format)       itineraries#update
#                  DELETE /itineraries/:id(.:format)       itineraries#destroy
#     destinations GET    /destinations(.:format)          destinations#index
#                  POST   /destinations(.:format)          destinations#create
#  new_destination GET    /destinations/new(.:format)      destinations#new
# edit_destination GET    /destinations/:id/edit(.:format) destinations#edit
#      destination GET    /destinations/:id(.:format)      destinations#show
#                  PATCH  /destinations/:id(.:format)      destinations#update
#                  PUT    /destinations/:id(.:format)      destinations#update
#                  DELETE /destinations/:id(.:format)      destinations#destroy

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
