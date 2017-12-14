class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    line_items.inject(0) do |sum, line_item|
      line_price = line_item.item.price * line_item.quantity
      sum + line_price
    end
  end

  def add_item(item_id)
    if existing_line_item = LineItem.find_line_item(item_id, self.id)
      new_quantity = existing_line_item.quantity + 1
      existing_line_item.update(quantity: new_quantity)
      existing_line_item
    else
      line_item = LineItem.new(item_id: item_id, cart_id: self.id)
    end
  end

  def checkout
    self.line_items.each do |line_item|
      item = Item.find_by(id: line_item.item_id)
      new_inv = item.inventory - line_item.quantity
      item.update(inventory: new_inv)
    end
    self.update(status: "submitted")
    self.user.update(current_cart_id: nil)
  end
end
