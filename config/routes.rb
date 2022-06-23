Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  namespace :admin do

    root to: 'homes#top'

    resources :customers, only: [:index, :show, :edit, :update]

    resources :items, only: [:index, :show, :edit, :new, :create, :update]

    resources :orders, only: [:show, :update]

    resources :order_details, only: [:update]

    resources :genres, only: [:index, :edit, :create, :update]


  end


  scope module: :public do

    devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

     root to: "homes#top"
  get "/home/about" => "homes#about", as: "about"



    get 'customers/information' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'

    patch 'unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    get 'unsubscribe_check' => 'customers#unsubscribe_check'

    resources :items, only: [:index, :show]

    resources :carts, only: [:index, :update, :destroy, :create]
    delete 'destroy_all' => 'carts#destroy_all'

    resources :orders, only:[:index, :new, :show, :create]
    post 'confirm' => 'orders#confirm'
    get 'thx' => 'orders#thx'

    resources :deliveries, only: [:index, :edit, :create, :update, :destroy]

  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
