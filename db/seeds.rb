# Creating few users
User.create!([
  {email: "testuser@mvmanor.co.uk", password: "testuser", password_confirmation: "testuser"},
  {email: "testdj@mvmanor.co.uk", password: "testdjaccount", password_confirmation: "testdjaccount"},
  {email: "testcustomer@customer.co.uk", password: "testcustomeruser", password_confirmation: "testcustomeruser"}
])

#Create few carts
Cart.create!([
  {name: "cart-1", user_id: User.first.id},
  {name: "cart-2", user_id: User.second.id},
  {name: "cart-3", user_id: User.third.id}  
])

#Create few categories
Category.create!([
    {name: "Nikon", type: "Mirrorless", model: "2018"},
    {name: "Canon", type: "full frame", model: "2019"},
    {name: "Sony", type: "point and shoot", model: "2020"}
])

#Create few products    
Product.create!([
    #Adding 3 products to first cart, with first category
    {name: "product-A", category_id: Category.first.id, cart_id: Cart.first.id},
    {name: "product-B", category_id: Category.first.id, cart_id: Cart.first.id},
    {name: "product-C", category_id: Category.first.id, cart_id: Cart.first.id},

    #Adding 2 products to second cart, with second category
    {name: "product-D", category_id: Category.second.id, cart_id: Cart.second.id},
    {name: "product-E", category_id: Category.second.id, cart_id: Cart.second.id},

    #Adding 1 product to third cart, with third category
    {name: "product-F", category_id: Category.third.id, cart_id: Cart.third.id},
    {name: "product-G", category_id: Category.third.id, cart_id: Cart.third.id},
    {name: "product-H", category_id: Category.third.id, cart_id: Cart.third.id}


])