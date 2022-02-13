class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :title
      t.string :summary
      t.integer :type

      t.timestamps
    end
  end
end
