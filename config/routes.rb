Choose::Application.routes.draw do
  root to: 'confessions#main'

  devise_for :users, :path_names => {:sign_in => "login" } , :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  mount RailsAdmin::Engine => '/myadmin', :as => 'rails_admin'

  
  
  namespace :admin do
    get "/:path_name" => "confessions#manage"
    root to: "confessions#index"
    
    resources :confessions, :except => [:index,:show] do
      resources :posts, :except => [:index, :show, :new, :update] do
        put "update_approve" => "posts#update_approve"
        put "update_answer" => "posts#update_answer"
      end
    end
  end
  

  get "cfs/:path_name" => "confessions#show", as: 'get_confess'
  
  resources :posts, :only => [:show] do
    put "comment" => "posts#add_comment"
    patch "comment" => "posts#add_comment"

    put "toggle_love" => "posts#toggle_love"
    patch "toggle_love" => "posts#toggle_love"
  end
  
  resources :confessions, :only => [:show] do
    put "add_post" => "confessions#add_post"
    patch "add_post" => "confessions#add_post"

    put "toggle_love" => "confessions#toggle_love"
    patch "toggle_love" => "confessions#toggle_love"
  end


  get "contact" => "contact#index"
  

end
