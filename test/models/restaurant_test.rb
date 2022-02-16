# == Schema Information
#
# Table name: restaurants
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :string
#  hours          :string
#  address        :string
#  city           :string
#  state          :string
#  website        :string
#  phone_number   :string
#  employee_count :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class RestaurantTest < ActiveSupport::TestCase
  
  test "restaurant has many menus" do
    restaurant = Restaurant.create
    menu1 = Menu.new :title => "Desert Menu"

    menu2 = Menu.new :title => "Cocktail Menu"
    restaurant.menus.push(menu1, menu2)

    assert_equal 2, restaurant.menus.count
  end
end
