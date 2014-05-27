class Payment < ActiveRecord::Base
  self.table_name = 'payment'
  self.inheritance_column = '_type'
  self.bad_attribute_names :valid

  belongs_to :order, :foreign_key => 'orderId'
end