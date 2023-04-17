Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :user, controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, controllers: {
    sessions: "admin/sessions",
  }

  # ゲストログイン用
  # post '/homes/guest_sign_in' => 'homes#guest_sign_in'
  devise_scope :user do
    post 'user/guest_sign_in' => 'user/sessions#guest_sign_in'
  end


  scope module: :user do
    # post '/homes/guest_sign_in' => 'homes#guest_sign_in'  # ゲストログイン用
    root to: 'homes#top'
    get 'homes/about'
    get 'users/mypage/edit' => 'users#edit'
    patch 'users/mypage/edit' => 'users#update'
    get 'users/check'
    patch 'users/withdraw'
    resources:users, only: [:index, :show, :edit, :destroy]

    resources:breads, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources:comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end

    get 'favorites/show'

    resources:topics, only: [:index, :show]
    get 'shops/onlines'

    resources:shops, only: [:index, :show] do
      collection do
        get 'search'
      end
    end

    get 'drinks/index'
  end

  namespace :admin do
    root to: 'homes#top'
    resources:users, only: [:index, :show, :edit, :update, :destroy]

    resources:breads, only: [:index, :show, :destroy] do
      resources:comments, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end

    resources:topics, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources:shops, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources:drinks, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
