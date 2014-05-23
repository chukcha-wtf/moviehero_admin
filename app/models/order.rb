class Order < ActiveRecord::Base
  self.table_name = 'ORDER'

  belongs_to :user, :foreign_key => 'userId'
  belongs_to :circuit, :foreign_key => 'circuitId'

  has_many :order_items, :foreign_key => 'orderId'
  has_many :payments, :foreign_key => 'orderId'
end