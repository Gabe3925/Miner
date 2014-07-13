Rails.application.routes.draw do

  root 'welcome#index'
  resources :sessions, only: [:create]

  resources :users do
    resources :mines, :tools
  end

  resources :users do
  put :update_tool, :on => :collection
  end

#========= CUSTOM ROUTES =============#

  #login/out custom routes:
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'

  # Takes a user to the store...
  get '/users/:id/store' => 'users#index'

  # Should update a users tool and decrease dollars upon BUYING at store...
  # get 'users/:id/store/:id' => 'users#purchase'

  #updates users dollars upon leaving graphic gameplay...
  get '/update_dollars' => 'users#update_dollars'

  #updates users' mine depth upon leaving graphic gameplay...
  get '/update_depth' => 'mines#update_depth'

  #special route to HQ
  get '/users/:id/mines/:mine_id' => 'users#show'


end
