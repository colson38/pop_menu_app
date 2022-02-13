require "test_helper"

class MenuItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "menuitems with no valid menu_id" do
    menu = Menu.create
    wrong_id = menu.id + 1

    item = MenuItem.new(menu_id: wrong_id)

    # this should be false, menuitem with id not associated with a valid menu should not be valid therefore should not save
    assert_not item.save
  end

  test "menuitems with valid menu_id" do
    menu = Menu.create
    item = MenuItem.new(menu_id: menu.id)

    assert item.save
  end

end
