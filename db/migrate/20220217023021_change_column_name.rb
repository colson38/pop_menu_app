class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :menu_items, :item_type, :type
  end
end
