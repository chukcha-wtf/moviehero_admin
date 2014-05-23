class OrderItem < ActiveRecord::Base
  self.table_name = 'OrderItem'
  self.inheritance_column = '_type'

  belongs_to :order, :foreign_key => 'orderId'

  belongs_to :orderable, polymorphic: true, :foreign_key => 'foreignId', foreign_type: 'type'

end