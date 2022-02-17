# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  first_name   :string
#  last_name    :string
#  user_name    :string
#  password     :string
#  phone_number :string
#  email        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "Get frequent dining day" do
    d1 = Date.new(2022,2,15)
    d2 = Date.new(2022,2,15)
    d3 = Date.new(2022,2,15)
    d4 = Date.new(2022,2,15)
    d5 = Date.new(2022,2,1)
    d6 = Date.new(2022,2,16)

    user = User.create!

    user.orders.push(Order.create :created_at => d1)
    user.orders.push(Order.create :created_at => d2)
    user.orders.push(Order.create :created_at => d3)
    user.orders.push(Order.create :created_at => d4)
    user.orders.push(Order.create :created_at => d5)
    user.orders.push(Order.create :created_at => d6)

    assert_equal "Tuesday", user.favorite_dining_day
  end

  test "Get frequent dining dish" do
    user = User.create!

    user.orders.push(Order.create )
    user.orders.push(Order.create )
    user.orders.push(Order.create )

    item1 = MenuItem.create! :name => "Fish Fry",
                        :price => 15.00,
                        :item_type => 1
    item2 = MenuItem.create! :name => "Scallops",
    :price => 15.00,
    :item_type => 1

    user.orders[0].add_to_order(item1, 1)
    user.orders[0].add_to_order(item1, 1)
    user.orders[0].add_to_order(item1, 1)
    user.orders[1].add_to_order(item1, 1)
    user.orders[1].add_to_order(item2, 1)
    user.orders[2].add_to_order(item2, 1)
    assert_equal "Fish Fry", user.favorite_dining_dish
  end
  

end
