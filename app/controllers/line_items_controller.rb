class LineItemsController < ApplicationController

  def create
    @cart = current_user.find_or_create_current_cart
    @line_item = LineItem.new_or_update_line_item(@cart.id, params[:item_id])
  end

end
