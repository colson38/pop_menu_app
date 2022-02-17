# == Schema Information
#
# Table name: menus
#
#  id            :integer          not null, primary key
#  title         :string
#  summary       :string
#  type          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#
require "test_helper"

class MenuTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "menu has many menuitems" do
    menu = Menu.create
    item1 = MenuItem.new :name => "Chicken Fingers",
                        :price => 500.25,
                        :item_type => 2

    item2 = MenuItem.new :name => "Burger",
                        :price => 5.25,
                        :item_type => 2
                        
    menu.menu_items.push(item1, item2)

    assert_equal 2, menu.menu_items.count
  end
end
