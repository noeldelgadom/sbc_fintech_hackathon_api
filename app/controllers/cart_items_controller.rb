class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:update, :destroy]

  def create
    @cart_item = CartItem.new(cart_item_params)

    if @cart_item.save
      render :show, status: :created, location: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @cart_item.update(cart_item_params)
      render :show, status: :ok, location: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_item.destroy
  end

  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    def cart_item_params
      params.require(:cart_item).permit(:item_id, :company_id, :user_id, :quantity)
    end
end
