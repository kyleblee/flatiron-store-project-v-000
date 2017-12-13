class AddItemsToCarts < ActiveRecord::Migration
  def change
    Cart.find_by(id: 1).items << Item.all
    Cart.find_by(id: 2).items << Item.all
    Cart.find_by(id: 3).items << Item.all
    Cart.find_by(id: 4).items << Item.all
    Cart.find_by(id: 5).items << Item.all
  end
end
