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
  # test "the truth" do
  #   assert true
  # end
end
