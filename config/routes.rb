Rails.application.routes.draw do
  scope module: :public do
    root to: 'homes#top'
    get '/about' => "homes#about"
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete :destroy_all
      end
    end
    resources :orders, only: [:index, :show, :new ,:create] do
      collection do
        post :confirm
        get :completion
      end
    end
    resources :addresses, only: [:index, :edit, :update, :create, :destroy]
    resources :customers, only: [:show, :edit, :update] do
      get "confirmation" => "customers#confirmation"
    end
  end

  namespace :admin do
    resources :items, only: [:new, :show, :index, :create, :update, :edit ]

    resources :genres, only: [:index, :create, :edit, :update]
  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
