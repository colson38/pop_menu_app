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
class MenuMenuItem < ApplicationRecord
    belongs_to :menu
    belongs_to :menu_item

    validates :menu_id, :menu_item_id, presence: true
end
