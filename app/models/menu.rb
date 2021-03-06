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
class Menu < ApplicationRecord
    has_many :menu_menu_items
    has_many :menu_items, :through => :menu_menu_items
end
