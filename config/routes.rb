Rails.application.routes.draw do

  post 'comentario', to: 'web_comentarios#create'

  namespace 'api' do
    devise_for :users, path: '', controllers: { sessions: 'api/sessions' },
                       path_names: { sign_in: 'login', sign_out: 'logout' },
                       sign_out_via: :delete
  end


  namespace 'admin' do
    devise_for :users, path: '', controllers: { sessions: 'admin/sessions' },
                       path_names: { sign_in: 'login', sign_out: 'logout' },
                       sign_out_via: [:delete, :get, :post]
    root to: redirect('admin/dashboard')
    get 'dashboard', to: 'app#index'
    resources :clientes, :agendamentos, :produtos, :web_comentarios
    # resources :atendimentos # TODO, ajudantes
    # resources :servicos # TODO, rever rotas (GET edit e new via AJAX)(neasted)
    # resources :categoria_servicos # TODO, rever rotas ( GET edit e new via AJAX)
    # resources :users # TODO, neasted com funcionario
  end

  scope module: 'web' do
    post 'login', to: 'sessions#create'
    get 'login', to: 'sessions#new'
    get 'logout', to: 'sessions#destroy'
    get 'app', to: 'app#index'
    resources :agendamentos, except: [:edit, :new]
  end



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
