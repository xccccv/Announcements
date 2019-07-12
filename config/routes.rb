Rails.application.routes.draw do
  
  root 'announcements#index'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  post 'announcements/search' => 'announcements#search', as: 'search_announcements'

  resources :users do
    member do
      get :delete 
    end
  end

  resources :comments do 
    member do 
      get :delete
    end
  end

  resources :tags do 
    member do 
      get :delete
    end
  end

  resources :announcements do 
    member do 
        get :delete
    end
  end

end
