Rails.application.routes.draw do










  namespace :admin do

    root to: 'homes#top'

    resources :customers, only: [:index, :show, :edit, :update]

    resources :items, only: [:index, :show, :edit, :new, :create, :update]

    resources :orders, only: [:show, :update]

    resources :order_details, only: [:update]

    resources :genres, only: [:index, :edit, :create, :update]


  end


  namespace :public do

     root to: "homes#top"
  get "/home/about" => "homes#about", as: "about"

    resources  :customers, only: [:show, :edit, :update]
    patch 'unsubscribe' => 'customers#unsubscribe'
    get 'unsubscribe_check' => 'customers#unsubscribe_check'

    resources :items, only: [:index, :show]

    resources :carts, only: [:index, :update, :destroy, :create]
    delete 'destroy_all' => 'carts#destroy_all'

    resources :orders, only:[:index, :new, :show, :create]
    post 'confirm' => 'orders#confirm'
    get 'thx' => 'orders#thx'

    resources :derivaries, only: [:index, :edit, :create, :update, :destroy]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
