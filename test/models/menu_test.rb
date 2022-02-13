require "test_helper"

class MenuTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    
  end

  test "menu has many menuitems" do
    menu = Menu.new 
    item1 = MenuItem.new :name => "Chicken Fingers",
                        :price => 500.25

    item2 = MenuItem.new :name => "Burger",
                        :price => 5.25
    menu.menu_items << sc
  end
end
