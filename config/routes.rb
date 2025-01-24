Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "home#index"
  # ログインとログアウトのルート
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  #resources :poolsをresources :citiesにネスト
  resources :cities, only: [:index, :show], param: :slug do
    resources :pools, only: [:show]
  end

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :pools, only: [:index] do
    collection do
      get :search
    end
  end

  resources :posts do
    collection do
      get 'new_routine', to: 'posts#new_routine'
      get 'new_review', to: 'posts#new_review'
    end
  end
  
end
