class AddOrderIdToMenuItem < ActiveRecord::Migration[7.0]
  def change
    add_column :menu_items, :order_id, :integer 
  end
end
