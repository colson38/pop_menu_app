# == Schema Information
#
# Table name: order_items
#
#  id           :integer          not null, primary key
#  name         :string
#  price        :decimal(5, 2)
#  menu_item_id :integer
#  order_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  quantity     :integer
#
class OrderItem < ApplicationRecord
    belongs_to :orders
    belongs_to :menu_items

    validates_presence_of :order_id, :menu_item_id, :price
end
