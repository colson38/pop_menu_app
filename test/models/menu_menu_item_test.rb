# == Schema Information
#
# Table name: menu_menu_items
#
#  id           :integer          not null, primary key
#  menu_id      :integer
#  menu_item_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class MenuMenuItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
