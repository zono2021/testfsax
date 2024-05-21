Rails.application.routes.draw do
  get 'users/signup'
  
  get '' => 'home#top'
  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'
  post 'posts/:id/destroy' => 'posts#destroy'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  get 'signup' => 'users#signup'
  post 'users/create' => 'users#create'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  get 'adsignup' =>'admin#adsignup'
  post 'admin/adcreate' => 'admin#adcreate'
  get 'admin/adindex' => 'admin#adindex'
  get 'adlogin' => 'admin#adlogin_form'
  post 'adlogin' => 'admin#adlogin'
  post 'adlogout' => 'admin#adlogout'
  post 'admin/:id/addestroy' => 'admin#addestroy'
  get 'admin/:id/adedit' => 'admin#adedit'
  post 'admin/:id/adupdate' => 'admin#adupdate'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
