class CreateMenuItems < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_items do |t|
      t.float :price
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
