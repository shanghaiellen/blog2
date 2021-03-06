Blog::Application.routes.draw do
  get "sessions/new"
  get "users/new"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get  'posts'          => 'posts#index',      as: :posts
  get  'log_out'        => 'sessions#destroy', as: :log_out
  get  'log_in'         => 'sessions#new',     as: :log_in
  get  'sign_up'        => 'users#new',        as: :sign_up
  get  'posts/new'      => 'posts#new',        as: :new_post
  post 'posts'          => 'posts#create',     as: :create_post
  get  'post/:id'       => 'posts#show',       as: :post
  get  'comments'       => 'comments#index',   as: :comments
  get  'comments/new'   => 'comments#new',     as: :new_comment
  post 'comments'       => 'comments#create',  as: :create_comment
  get  'comment/:id'    => 'comments#show',    as: :comment
  get  'users/:id'      => 'users#show',       as: :user
  get  'about'          => 'static#about',     as: :about
  get  'resume'         => 'static#resume',    as: :resume
  get  'projects'       => 'static#projects',  as: :projects
  get  'admin'          => 'users#admin',      as: :admin

  
  resources :users
  resources :sessions

  get  '/:page',                               to: 'welcome#index'
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
