Mtj::Application.routes.draw do

  match 'generate', to: 'info#get_companies'
  match 'get_company_info', to: 'info#get_company_info'

  resources :answers

  resources :questions
  
  resources :offers

  resources :interviews

  root :to =>  "static_pages#home"

  match 'companies/search', to: "companies#search"
  resources :companies
  resources :users
  
  match 'companies/search/:id', to: "companies#search"
  match 'companies/:id/interviews', to: 'companies#interview', :as => :interview
  match 'companies/:id/new_interview', to: 'companies#new_interview', :as => :new_interview
  match 'add/interview', to: 'interviews#create'

  match 'companies/:id/offers', to: 'companies#offer', :as => :offer
  match 'companies/:id/new_offer', to: 'companies#new_offer', :as => :new_offer
  match 'add/offer', to: 'offers#create'

  match 'companies/:id/questions', to: 'companies#question', :as => :question
  match 'companies/:id/new_question', to: 'companies#new_question', :as => :new_question
  match 'add/question', to: 'questions#create_question'

  match 'questions/:id/answers', to: 'questions#answer', :as => :answer
  match 'questions/:id/new_answer', to: 'questions#new_answer', :as => :new_answer
  match 'add/answer', to: 'answers#create'

  match 'register' => 'static_pages#register', :format => "false"
  match 'login' => 'static_pages#login', :format => false
  match 'logout' => 'sessions#destroy'
  match 'sessions' => 'sessions#login'
  match 'create_account' => 'sessions#create'
  match 'settings' => 'static_pages#change_password'
  match 'change_password' => 'users#change_password'
  match 'activate/:serial' => 'sessions#activate'
  match 'deactivate/:serial' => 'sessions#deactivate'
  match 'reactivate/:serial' => 'sessions#reactivate'

  match 'questions/create_answer', to: 'questions#create_answer'
  match 'questions/upvote/:id', to: 'questions#downvote'
  match 'questions/downvote/:id', to: 'questions#upvote'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
