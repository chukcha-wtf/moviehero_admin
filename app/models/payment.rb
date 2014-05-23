class Payment < ActiveRecord::Base
  self.table_name = 'Payment'
  self.inheritance_column = '_type'
  self.bad_attribute_names :valid

  belongs_to :order, :foreign_key => 'orderId'
end