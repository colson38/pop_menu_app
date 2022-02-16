class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :hours
      t.string :address
      t.string :city
      t.string :state
      t.string :website
      t.string :phone_number
      t.integer :employee_count

      t.timestamps
    end
  end
end
