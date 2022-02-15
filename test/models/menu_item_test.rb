# == Schema Information
#
# Table name: menu_items
#
#  id          :integer          not null, primary key
#  price       :decimal(, )
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class MenuItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # Commenting old tests out due to new functionality. Commenting not deleting to still show old test functionality
  # test "menuitems with no valid menu_id" do
  #   menu = Menu.create
  #   wrong_id = menu.id + 1

  #   item = MenuItem.new(menu_id: wrong_id)

  #   # this should be false, menuitem with id not associated with a valid menu should not be valid therefore should not save
  #   assert_not item.save
  # end

  # test "menuitems with valid menu_id" do
  #   menu = Menu.create
  #   item = MenuItem.new(menu_id: menu.id)

  #   assert item.save
  # end

  # test "menuitems with valid menu_id" do
  #   menu = Menu.create
  #   item = MenuItem.new(menu_id: menu.id)

  #   assert item.save
  # end

  test "menuitem names should not be duplicated" do
    item1 = MenuItem.new(name: "Crepes")
    item2 = MenuItem.new(name: "Crepes")

    item1.save

    assert_not item2.save
  end

  test "menuitem has many menus" do
    menu_item = MenuItem.create
    menu1 = Menu.new :title => "Desert Menu"

    menu2 = Menu.new :title => "Cocktail Menu"

    menu_item.menus.push(menu1, menu2)

    assert_equal 2, menu_item.menus.count
  end


end
