Rails.application.routes.draw do
  resources :carts
  namespace :api do
    namespace :v1 do
      resources :products 
      
      resources :categories
      # resources :categories do
      #   get '/api/v1/categories/:category_name', to: "categories#specific_products"
      # end
    end
  end
  get '/api/v1/products/:category_name', to: "api/v1/categories#specific_products"
  post 'authenticate', to: 'authentication#authenticate'
end
