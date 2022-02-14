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
    has_many :menu_menu_items
    has_many :menus, :through => :menu_menu_items

    validates :menu, :presence => true
    validates :name, :uniqueness => true

end
