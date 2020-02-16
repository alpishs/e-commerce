Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :carts
      resources :products
      resources :categories
      match 'specific_products/:category_name' => 'products#specific_products', :via => :get
      match '/add_product_to_cart/:cart_name' => 'products#add_product_to_cart', :via => :post
      match 'specific_cart/:user_email' => 'carts#get_cart', :via => :get
    end
  end
  
  post 'authenticate', to: 'authentication#authenticate'
end
