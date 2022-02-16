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
#  type        :integer          not null
#  order_id    :integer
#
class MenuItem < ApplicationRecord
    has_many :menu_menu_items
    has_many :menus, :through => :menu_menu_items

    belongs_to :orders

    validates :name, :uniqueness => true
    validates_inclusion_of :type, :in => 1..4

    ENTREE = 1
    APPETIZER = 2
    SIDE = 3
    DRESSING = 4

end
