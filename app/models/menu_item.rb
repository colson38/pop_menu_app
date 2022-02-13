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
#  menu_id     :integer
#
class MenuItem < ApplicationRecord
    belongs_to :menu
    validates :menu, :presence => true
end
