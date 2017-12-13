class AddInitialCarts < ActiveRecord::Migration
  def change
    5.times do |i|
      Cart.create(user_id: 1)
    end
  end
end
