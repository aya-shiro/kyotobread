Rails.application.routes.draw do

  scope module: :user do
    root to: 'homes#top'
    get 'homes/about'
    get 'users/mypage' => 'users#show'
    get 'users/mypage/edit' => 'users#edit'
    patch 'users/mypage/edit' => 'users#update'
    resources:users, only: [:index, :edit, :destroy]

    resources:breads, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources:comments, only: [:create]
    end

    resources:topics, only: [:index, :show]
    resources:onlines, only: [:index, :show]
    resources:shops, only: [:index, :show]
    get 'drinks/index'
  end

  namespace :admin do
    root to: 'homes#top'
    resources:users, only: [:index, :show, :destroy]
    resources:breads, only: [:index, :show, :destroy]
    resources:topics, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources:onlines, only: [:index, :new, :create, :edit, :update,  :destroy]
    resources:shops, only: [:index, :new, :create, :edit, :update, :destroy]
    resources:drinks, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :user, controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
