Rails.application.routes.draw do
    root 'home#index'
    
    match ":controller(/:action(/:id))", :via =>
    [:get, :post]
    get 'destroy_wall/:post_id' => 'home#destroy_wall'
    get 'destroy_rp/:post_id' => 'home#destroy_rp'
    get 'destroy/:post_id' => 'home#destroy'
    get 'update_view/:post_id' => 'home#update_view'
    get 'real_update/:post_id' => 'home#real_update'
    
    
    # get 'team_page/:id' => "home#team_page"
    # post 'home/team_schedule'
    # #  post 'team_page/:id/view_of_write' => "home/view_of_write"
    # get 'team_page/:id/view_of_write' => 'home#write'
    # get 'team_page/view_of_write'
   
    devise_for :users, controllers: {
    :registrations => "users/registrations",
    :sessions => "users/sessions" }
  
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
