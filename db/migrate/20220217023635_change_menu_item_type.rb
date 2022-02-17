class ChangeMenuItemType < ActiveRecord::Migration[7.0]
  def change
    rename_column :menu_items, :type, :item_type
  end
end
