# Camera Store

# Steps to setup Project:

  1. git clone https://github.com/alpishs/e-commerce.git
  2. cd e-commerce
  3. rvm use 2.6.2
  4. bundle install
  5. rake db:create
  6. rake db:migrate
  7. rake db:seed

  # I have added default data into seeds file to play with API's, just authenticate user and use all API's check below steps in order to proceed.

# Steps to play with API's:

  * Now in order to consume Api and play with the application, please follow below steps provided:

  * In seed file there is three user with email id: testuser@mvmanor.co.uk, testdj@mvmanor.co.uk, testcustomer@customer.co.uk.

  * Pick any of this user say: testcustomer@customer.co.uk and first authenticate it with API(User login) by hitting curl request given here:

         curl -H "Content-Type: application/json" -X POST -d '{"email":"testcustomer@customer.co.uk","password":"testcustomeruser"}' http://localhost:3000/authenticate
  
    After hitting this curl request you will be getting one authorization taken, so now after this step you're authorized to play and consume below given API, for e.g:

  * Now in order list all products hit below curl request:

        Curl Request: curl -H "Authorization: pass value of token you get from user login API" GET http://localhost:3000/api/v1/products/

    If you pass here wrong token, you will not be authorized to see list of products.

# Below are the APIs:

  • list all products:

      Curl Request: curl -H "Authorization: XXXXXXXXXXXXXXXX" GET http://localhost:3000/api/v1/products/
      
  • list all categories:

      curl -H "Authorization: XXXXXXXXXXXXXXXX" GET http://localhost:3000/api/v1/categories/
      
  • list all products of a specific category:

      curl -H "Authorization: XXXXXXXXXXXXXXXX" GET http://localhost:3000/api/v1/specific_products/Canon
      
  • User login:

      curl -H "Content-Type: application/json" -X POST -d '{"email":"example@mail.com","password":"123123123"}' http://localhost:3000/authenticate
      
  • Add Product to cart:

      curl -H "Authorization: XXXXXXXXXXXXXXXX" POST  -d '{"request":{category_name: "Sony", category_type: "Mirrorless",  description: "adding product to cart", price: "200$", make: "2020"}}' http://localhost:3000/api/v1/add_product_to_cart/product-D/cart-123
      
  • Get cart for a specific user:

      curl -H "Authorization: XXXXXXXXXXXXXXXX" GET http://localhost:3000/api/v1/specific_cart/2
