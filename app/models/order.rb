# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  paid       :boolean          default(FALSE)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Order < ApplicationRecord
    has_many :menu_items

    def add_to_order(item, side_as_entree = false)
        case item.type
        when 1
        
        when 2
           
        when 3

        else
           
        end
    end
end
