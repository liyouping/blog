Rails.application.routes.draw do

  resource :wechat, only: [:show, :create]
  resources :users
  resources :activities
  resources :images do
    collection do
        get :idcard
    end
  end

  root "articles#index"
  resources :articles do
    collection do
      get :about
      get :contact
      post :send_message
    end
  end

  #------  admin routes start ----
  namespace :admin, path: "lyp" do
    root "articles#index"
    resources :tags, :categories,:articles
    resources :articles do
      collection do
        post :view
      end
    end
  end
  #------ admin routes end ----
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # make sure this rule is the last one
end