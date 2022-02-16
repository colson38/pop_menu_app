class AddTypeToMenuItem < ActiveRecord::Migration[7.0]
  def change
    add_column :menu_items, :type, :integer
  end
end
