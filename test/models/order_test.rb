# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  paid       :boolean          default(FALSE)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "Add entree to order" do
    u = User.create!
    u.orders.push(Order.create)
    order = u.orders.first

    item1 = MenuItem.create! :name => "Chicken Fingers",
                        :price => 50.25,
                        :item_type => 1

    u.orders.first.add_to_order(item1, 1)
    
    assert_equal 1, order.order_items.count
  end

  test "Add appetizer to order" do
    u = User.create!
    u.orders.push(Order.create)
    order = u.orders.first

    item1 = MenuItem.create! :name => "Chicken Fingers",
                        :price => 50.25,
                        :item_type => 2

    order.add_to_order(item1, 1)
    
    assert_equal 1, order.order_items.count
  end

  test "Add already ordered item to order" do
    u = User.create!
    u.orders.push(Order.create)
    order = u.orders.first
    
    item1 = MenuItem.create! :name => "Chicken Fingers",
                        :price => 12.00,
                        :item_type => 1

    order.add_to_order(item1, 1)
    order.add_to_order(item1, 2)

    assert_equal 3, order.order_items.first.quantity
  end

  test "Add side to order, make sure price is zero for salad" do
    u = User.create!
    u.orders.push(Order.create)
    order = u.orders.first

    item1 = MenuItem.create! :name => "Chicken Fingers",
                        :price => 12.00,
                        :item_type => 1

    item2 = MenuItem.create! :name => "Salad",
                        :price => 5.00,
                        :item_type => 3

    order.add_to_order(item1, 1)
    order.add_to_order(item2, 1)
    
    assert_equal 0, order.order_items.last.price
  end

  test "Add side to order with no entree, make sure price is not zero for salad" do
    u = User.create!
    u.orders.push(Order.create)
    order = u.orders.first

    item1 = MenuItem.create! :name => "Salad",
                        :price => 5.00,
                        :item_type => 3

    order.add_to_order(item1, 1)
    
    assert_equal 5.00, order.order_items.last.price
  end

  test "Add standalone side to order with entrees, make sure price is not zero for salad" do
    u = User.create!
    u.orders.push(Order.create)
    order = u.orders.first

    item1 = MenuItem.create! :name => "Chicken Fingers",
                            :price => 12.00,
                            :item_type => 1

    item2 = MenuItem.create! :name => "Salad",
                        :price => 5.00,
                        :item_type => 3

    order.add_to_order(item1, 1)
    order.add_to_order(item2, 1, true)

    assert_equal 5.00, order.order_items.last.price
  end

  test "Order just a sauce" do
    u = User.create!
    u.orders.push(Order.create)
    order = u.orders.first

    item1 = MenuItem.create! :name => "Chick-fil-A Sauce",
                            :price => 0,
                            :item_type => 4

    assert_raise(RuntimeError){order.add_to_order(item1, 1)}
  end

  test "Order more sauces than entrees" do
    u = User.create!
    u.orders.push(Order.create)
    order = u.orders.first
    
    item1 = MenuItem.create! :name => "Burger",
                        :price => 15.00,
                        :item_type => 1
    item2 = MenuItem.create! :name => "Chick-fil-A Sauce",
                            :price => 0,
                            :item_type => 4

    order.add_to_order(item1, 1)
    assert_raise(RuntimeError){order.add_to_order(item2, 2)}
  end

end
