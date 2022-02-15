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
class Restaurant < ApplicationRecord
    has_many :menus
end
