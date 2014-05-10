Homework1::Application.routes.draw do
  resources :portfolios

  get "pages/index"
  devise_for :members
  resources :investments
  resources :stocks
  resources :members, only: [:show, :index]
  resources :posts
  resources :pages
  
  get "refresh_stocks", to: "stocks#refresh_stocks"
  get "increment_stock/:id/:i_id", to: "stocks#increment_stock", as: "increment_stock"
  get "deincrement_stock/:id/:i_id", to: "stocks#deincrement_stock", as: "deincrement_stock"
  get "delete_stock_investments/:id", to: "investments#delete_stock_investments", as: "delete_stock_investments"
  get "order/:dollar/:decimal", to: "portfolios#order", as: "order"
  
  root 'home#index'
  
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
