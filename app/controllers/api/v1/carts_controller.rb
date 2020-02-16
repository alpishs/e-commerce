class Api::V1::CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy]
  before_action :set_user, only: [:get_cart]
  
  # GET /carts
  def index
   @carts = Cart.all
   render json: @carts
  end
  
  # GET /carts/1
  def show
   render json: @cart
  end
  
  # POST /carts
  def create
   @cart = Cart.new(cart_params)
   if @cart.save
    render json: @cart, status: :created, location: api_v1_cart_url(@cart)
   else
    render json: @cart.errors, status: :unprocessable_entity
   end
  end
  
  # PATCH/PUT /carts/1
  def update
   if @cart.update(cart_params)
    render json: @cart
   else
    render json: @cart.errors, status: :unprocessable_entity
   end
  end
  
  # DELETE /carts/1
  def destroy
   @cart.destroy
  end

  def get_cart
    @cart = @user.cart
    render json: @cart
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
   @cart = cart_params.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
  
  # Only allow a trusted parameter “white list” through.
  def carts_params
    params.require(:carts).permit!
  end
end