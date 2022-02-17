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
    has_many :order_items

    def add_to_order(item, quantity, side_as_entree = false)
        type = item.type
        item_already_ordered = nil

        self.order_items.each do |i|
            if i.menu_item_id == item.id
                item_already_ordered = i
                break
            end
        end

        if item_already_ordered
            item_already_ordered.update(:quantity => item_already_ordered.quantity + quantity)
        else
            if type == MenuItem::ENTREE || type == MenuItem::APPETIZER
                self.order_items.create! :menu_item => item,
                                         :name => item.name,
                                         :price => item.price,
                                         :quantity =>  quantity
                puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
            elsif type == MenuItem::SIDE
                self.order_items.create! :menu_item => item,
                                         :name => item.name,
                                         :price => side_as_entree || !is_valid_side_or_sauce(item, quantity) ? item.price : 0,
                                         :quantity =>  quantity

                                         puts "VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV"
            else
               if is_valid_side_or_sauce(item, quantity)
                self.order_items.create! :menu_item => item,
                                         :name => item.name,
                                         :price => 0,
                                         :quantity =>  quantity
                                         puts "bBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
               else
                raise "Too many sauces selected."
               end
            end
        end
        
    end

    def is_valid_side_or_sauce(item, quantity)
        num_entrees = self.order_items.collect(&:type).count(MenuItem::ENTREE)
        num_apps = self.order_items.collect(&:type).count(MenuItem::APPETIZER)
        num_dressings = self.order_items.collect(&:type).count(MenuItem::DRESSING)
        num_sides = self.order_items.collect(&:type).count(MenuItem::SIDE)

        if item.type == MenuItem::DRESSING
            num_dressings + quantity <= num_apps + num_entrees
        else
            num_sides + quantity <= num_apps
        end
    end
end
