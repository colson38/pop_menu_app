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
  # test "the truth" do
  #   assert true
  # end
end
