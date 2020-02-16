class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :set_cart, only: [:add_product_to_cart]
    
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
    render json: @product, status: :created, location:        api_v1_product_url(@product)
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
    debugger
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_product
   @product = product_params.find(params[:id])
  end

  def set_cart
    debugger
    @cart = Cart.where(:name => params[:cart_name]).first_or_create
  end
  
  # Only allow a trusted parameter “white list” through.
  def product_params
    params.require(:product).permit!
  end
end