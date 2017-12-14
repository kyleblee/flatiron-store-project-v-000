class LineItemsController < ApplicationController

  def create
    @cart = current_user.find_or_create_current_cart
    @cart.add_item(params[:item_id]).save
    binding.pry # what is the @cart here
    redirect_to cart_url(@cart)
  end

end
