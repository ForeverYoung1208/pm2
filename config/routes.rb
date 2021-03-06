Rails.application.routes.draw do
  


  resources :areas
  
  get 'starts/build_links_to_area' => 'starts#build_links_to_area', as: 'build_links_to_area'
  get 'starts/load_areas1_from_json_file' => 'starts#load_areas1_from_json_file', as: 'load_areas1_from_json_file'
  get 'starts/load_areas2_from_json_file' => 'starts#load_areas2_from_json_file', as: 'load_areas2_from_json_file'
  get 'starts/load_areas3_from_json_file' => 'starts#load_areas3_from_json_file', as: 'load_areas3_from_json_file'

  get 'starts/populate_fake_data' => 'starts#populate_fake_data', as: 'populate_fake_data'

  get 'starts/reload_linktable' => 'starts#reload_linktable', as: 'reload_linktable'
  get 'starts/attach_transfert_values' => 'starts#attach_transfert_values', as: 'attach_transfert_values'
  get 'transferts_map' => 'transferts#map', as: :transferts_map
  
  
  resources :transferts
  resources :starts

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'starts#index'

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
