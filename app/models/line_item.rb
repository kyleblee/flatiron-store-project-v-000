class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  def self.find_line_item(item_id, cart_id)
    where(item_id: item_id, cart_id: cart_id)[0]
  end
end
