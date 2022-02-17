class ChangeNullTypeMenuItem < ActiveRecord::Migration[7.0]
  def change
    change_column :menu_items, :type, :integer, null: false
  end
end
