# == Schema Information
#
# Table name: menu_items
#
#  id          :integer          not null, primary key
#  price       :decimal(5, 2)
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  item_type   :integer
#
class MenuItem < ApplicationRecord
    has_many :menu_menu_items
    has_many :menus, :through => :menu_menu_items

    validates :name, :uniqueness => true
    validates_inclusion_of :item_type, :in => 1..4

    ENTREE = 1
    APPETIZER = 2
    SIDE = 3
    DRESSING = 4

end
