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
  # test "the truth" do
  #   assert true
  # end
  test "menu has many menuitems" do
    order = Order.create
    item1 = MenuItem.new :name => "Chicken Fingers",
                        :price => 50.25

    item2 = MenuItem.new :name => "Burger",
                        :price => 5.25

    order.add_to_order(item1, 1)
    puts order.order_items.first
    assert_equal 1, order.order_items.count
  end
end
