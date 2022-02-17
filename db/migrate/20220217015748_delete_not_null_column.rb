class DeleteNotNullColumn < ActiveRecord::Migration[7.0]
  def change
    change_column_null :menu_items, :type, :integer, true
  end
end
