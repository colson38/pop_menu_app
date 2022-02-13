# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  title      :string
#  summary    :string
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Menu < ApplicationRecord
    has_many :menu_items
end
