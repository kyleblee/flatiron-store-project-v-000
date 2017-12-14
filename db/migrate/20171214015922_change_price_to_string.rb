class ChangePriceToString < ActiveRecord::Migration
  def change
    change_column :items, :price, :string
  end
end
