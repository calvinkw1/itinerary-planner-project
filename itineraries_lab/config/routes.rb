Rails.application.routes.draw do
  
  root 'access#index'
  resources :users
  resources :itineraries
  resources :destinations
  

#           Prefix Verb   URI Pattern                      Controller#Action
#             root GET    /                                access#index
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
