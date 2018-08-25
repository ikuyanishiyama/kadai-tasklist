Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # #CRUD
  # #ユーザが「id:〇なtaskを参照したい」というHTTPリクエストをRouterに送ってきたら、RouterはControllerに「tasksコントローラのshowアクションを実行しろ」と命令する
  # get "tasks/:id", to: "tasks#show" 
  # #ユーザが「tasksテーブルに新規追加したい」というHTTPリクエストをRouterに送ってきたら、RouterはControllerに「tasksコントローラのcleateアクションを実行しろ」と命令する
  # post "tasks", to: "tasks#create"
  # #ユーザが「id:〇なtaskを変更したい」というHTTPリクエストをRouterに送ってきたら、RouterはControllerに「tasksコントローラのupdateアクションを実行しろ」と命令する
  # put "tasks/:id", to: "tasks#update"
  # #ユーザが「id:〇なtaskを削除したい」というHTTPリクエストをRouterに送ってきたら、RouterはControllerに「tasksコントローラのdestroyアクションを実行しろ」と命令する
  # delete "tasks/:id", to: "tasks#destroy"

  # #以下上記を実際に行うための補助ページ

  # #index: show の補助ページ　(一覧の表示)
  # #ユーザが「taskの一覧を見たい」というHTTPリクエストをRouterに送ってきたら、RouterはControllerに「tasksコントローラのindexアクションを実行しろ」と命令する
  # get "tasks", to: "tasks#index"
  
  # #new: 新規作成用のフォームページ
  # #ユーザが「taskを作成するためのページを見たい」というHTTPリクエストをRouterに送ってきたら、RouterはControllerに「tasksコントローラのnewアクションを実行しろ」と命令する
  # get "tasks/new", to: "tasks#new"  
  
  # #edit: 更新用のフォームページ
  # #ユーザが「id:〇なtaskを変更するためのページを見たい」というHTTPリクエストをRouterに送ってきたら、RouterはControllerに「tasksコントローラのeditアクションを実行しろ」と命令する
  # get "tasks/:id/edit", to: "tasks#edit"

  #ユーザがトップページにアクセスしてきたら、indexアクションを実行しろ（root = "/"トップページをGET)
  root to: "toppages#index"
  
  #ユーザ登録機能用のフォームページ
  #signupのurlにアクセスしてきたら、usersコントローラのnewアクション実行
  get "signup", to: "users#new"
  #以下アカウントに関連したそれぞれのアクション
  resources :users, only: [:create]
  
  #ログイン機能用のルーティング
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  #タスク関連のルーティング
  resources :tasks

end