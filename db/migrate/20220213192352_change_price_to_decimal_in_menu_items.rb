class ChangePriceToDecimalInMenuItems < ActiveRecord::Migration[7.0]
  def change
      change_column :menu_items, :price, decimal
  end
end
