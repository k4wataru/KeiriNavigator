Rails.application.routes.draw do

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
}
  
  # ユーザー用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
}

  # 管理者用
  namespace :admin do
    root to: "homes#top"  # 管理者のトップページ
    resources :users, only: [:index, :show, :edit, :update]  # ユーザー関連
    resources :posts, only: [:show, :destroy]  # 投稿関連
    resources :comments, only: [:destroy]  # コメント削除（管理者用）
    resources :genres  # ジャンル管理
  end
  
  # ユーザー用
  scope module: :public do
    root to: "homes#top"  # ユーザーのトップページ
    get "home/about"=>"homes#about"
    resources :users, only: [:show, :edit, :update] do
      resources :relationships, only: [:create, :destroy]  # フォロー関連
      get 'followings', to: 'relationships#followings', as: 'followings'  # フォロー一覧
      get 'followers', to: 'relationships#followers', as: 'followers'  # フォロワー一覧
    end
    resource :mypage, controller: 'users', only: [:show, :edit, :update]  # マイページ
    resources :posts do
      resources :comments, only: [:create, :destroy]  # コメント
      resource :favorites, only: [:create, :destroy]  # いいね
      collection do
        get :search, to: 'posts#search'  # 投稿検索
        get :results, to: 'posts#search_results'  # 検索結果表示
      end
    end
  end
end