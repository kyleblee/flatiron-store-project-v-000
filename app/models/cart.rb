class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    items.sum(:price)
  end

  def add_item(item_id)
    if existing_line_item = LineItem.find_line_item(item_id, self.id)
      new_quantity = existing_line_item.quantity + 1
      existing_line_item.update(quantity: new_quantity)
      existing_line_item
    else
      LineItem.new(item_id: item_id, cart_id: self.id)
    end
  end
end
