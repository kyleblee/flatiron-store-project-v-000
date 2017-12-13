class AddInitialItems < ActiveRecord::Migration
  def change
    5.times do |i|
      Item.create(title: "Item #{i}", inventory: 5, price: 20)
    end
  end
end
