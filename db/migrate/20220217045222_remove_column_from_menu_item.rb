class RemoveColumnFromMenuItem < ActiveRecord::Migration[7.0]
  def change
    remove_column :menu_items, :order_id
  end
end
