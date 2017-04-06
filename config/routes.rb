Rails.application.routes.draw do

  resources :users
  resources :activities
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