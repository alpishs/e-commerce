class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :set_cart_and_category, only: [:add_product_to_cart]
    
  # GET /products
  def index
   @products = Product.all
   render json: @products
  end
  
  # GET /products/1
  def show
   render json: @product
  end
  
  # POST /products
  def create
   @product = Product.new(product_params)
   if @product.save
    render json: @product, status: :created, location: api_v1_product_url(@product)
   else
    render json: @product.errors, status: :unprocessable_entity
   end
  end
  
  # PATCH/PUT /products/1
  def update
   if @product.update(product_params)
    render json: @product
   else
    render json: @product.errors, status: :unprocessable_entity
   end
  end
  
  # DELETE /products/1
  def destroy
   @product.destroy
  end

  def specific_products
    @category = Category.find_by_name(params[:category_name])
    @products = Product.where(category_id: @category.id)
    render json: @products
  end

  def add_product_to_cart
    begin
      @product = Product.where(:name => params[:product_name]).first_or_create(
        name: params[:product_name], 
        category_id: @category.id, 
        cart_id: @cart.id, 
        price: @object[:request][:price], 
        description: @object[:request][:description], 
        make: @object[:request][:make])
      
      @cart.products << @product
      @cart.save!
      render :json => "success"
    rescue
      render :json => "fail"
    end
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_product
   @product = product_params.find(params[:id])
  end

  def set_cart_and_category
    @object = eval(request.body.read)
    @cart = Cart.where(:name => params[:cart_name]).first_or_create(:name => params[:cart_name], user_id: current_user.id)
    @category = Category.where(:name => @object[:request][:category_name]).first_or_create(name: @object[:request][:category_name], type: @object[:request][:category_type])
  end
  
  # Only allow a trusted parameter “white list” through.
  def product_params
    params.require(:product).permit!
  end
end