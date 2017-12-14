class LineItemsController < ApplicationController

  def create
    @cart = current_user.find_or_create_current_cart
    @cart.add_item(params[:item_id]).save
    redirect_to cart_url(@cart)
  end

end
