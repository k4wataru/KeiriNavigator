Rails.application.routes.draw do

  namespace :public do
    get 'searches/search'
  end
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # ユーザー用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  # 管理者用
  namespace :admin do
    root to: "homes#top"  # 管理者のトップページ
    resources :users, only: [:index, :show, :update]  # ユーザー関連
    resources :posts, only: [:show, :destroy]  # 投稿関連
    resources :comments, only: [:destroy]  # コメント削除（管理者用）
    resources :genres, only: [:index, :create, :edit, :destroy, :update]  # ジャンル管理
    patch "withdrawal/:id" => "users#withdrawal", as: "withdrawal"  # 退会機能
    
    resources :searches, only: [:index] do
      collection do
        get :search
      end
    end
  end

  # ユーザー用
  scope module: :public do
    root to: "homes#top"  # ユーザーのトップページ
    get "about" => "homes#about"
    get "users/my_page" => "users#show"
    get  '/users/check' => 'users#check' # 退会確認画面
    patch  '/users/withdraw' => 'users#withdraw' # 論理削除用のルーティング
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]  # フォロー関連
      get 'followings', to: 'relationships#followings', as: 'followings'  # フォロー一覧
      get 'followers', to: 'relationships#followers', as: 'followers'  # フォロワー一覧
    end
    resources :posts do
      resources :comments, only: [:create, :destroy]  # コメント
      resource :favorites, only: [:create, :destroy]  # いいね
      collection do
        get :search, to: 'searches#search'  # 投稿検索
        get :results, to: 'searches#search_results'  # 検索結果表示
      end
    end
  end
end