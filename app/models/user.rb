# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  first_name   :string
#  last_name    :string
#  user_name    :string
#  password     :string
#  phone_number :string
#  email        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class User < ApplicationRecord
    has_many :orders

    def favorite_dining_day
        days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
        highest_occurence = Hash.new(0)
        dates = self.orders.collect{|d| d.created_at.wday}

        dates.each do |o|
            highest_occurence[o] += 1
        end
        day = dates.max_by {|f| highest_occurence[f]}
        days[day]
    end

    def favorite_dining_dish
        dish = ['Pork', 'Scallops', 'Fish Fry', 'Burger']
        highest_occurence = Hash.new(0)
        order_ids = self.orders.collect(&:id)
        items = OrderItem.where(order_id: order_ids).collect(&:name)

        items.each do |o|
            highest_occurence[o] += 1
        end
        items.max_by {|f| highest_occurence[f]}

        
    end
end
