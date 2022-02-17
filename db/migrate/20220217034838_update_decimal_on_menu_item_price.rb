class UpdateDecimalOnMenuItemPrice < ActiveRecord::Migration[7.0]
  def change
    change_column :menu_items, :price, :decimal, precision: 5, scale: 2
  end
end