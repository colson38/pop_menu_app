class AddRestaurantIdToMenu < ActiveRecord::Migration[7.0]
  def change
    add_column :menus, :restaurant_id, :integer
  end
end
