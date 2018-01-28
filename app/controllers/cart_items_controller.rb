class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:update, :destroy]

  def create
    @cart_item = CartItem.new(params.require(:cart_item).permit(:user_id, :company_id, :item_id, :quantity))

    if @cart_item.save
      render :show, status: :created, location: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @cart_item.update(params.require(:cart_item).permit(:quantity))
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
end
