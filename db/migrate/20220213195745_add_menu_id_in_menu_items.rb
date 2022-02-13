class AddMenuIdInMenuItems < ActiveRecord::Migration[7.0]
  def change
    add_column :menu_items, :menu_id, :integer
  end
end
