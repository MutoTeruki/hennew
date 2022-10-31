Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]#この順番でないと正常に機能しない
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hennew' => 'hello#index'
  resources :profiles
  root 'profiles#index'

  resources :talks do
   resources :talks
   resources :likes, only: [:create, :destroy]
   resources :talk_comments, only: [:create]
  end

  resources :users do
    resources:users
  end
  
  resources :study_records do
    resources:study_records
  end

  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

  #resoucesとresouceの違い,後者はidなしで生成され、indexアクションもできない
  
end
