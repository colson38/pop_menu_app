# == Schema Information
#
# Table name: order_items
#
#  id           :integer          not null, primary key
#  name         :string
#  price        :decimal(5, 2)
#  menu_item_id :integer
#  order_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  quantity     :integer
#
require "test_helper"

class OrderItemTest < ActiveSupport::TestCase
  test "Check validation if no order" do
    item1 = MenuItem.create! :name => "Chicken Fingers",
                              :price => 12.00,
                              :item_type => 1
    assert !OrderItem.create(:menu_item => item1, :name => "Hotdog", :price => 30.00, :quantity => 1).valid?
  end

  test "Check validation if no menu_item" do
    order = Order.create
    
    assert !order.order_items.create(:name => "Hotdog", :price => 30.00, :quantity => 1).valid?
  end
end
