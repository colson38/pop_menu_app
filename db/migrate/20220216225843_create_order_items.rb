class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.string :name
      t.decimal :price, precision: 5, scale: 2
      t.integer :menu_item_id
      t.integer :order_id

      t.timestamps
    end
  end
end
