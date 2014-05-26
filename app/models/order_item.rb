class OrderItem < ActiveRecord::Base
  self.table_name = 'OrderItem'
  self.inheritance_column = '_type'

  belongs_to :order, :foreign_key => 'orderId'

  belongs_to :orderable, polymorphic: true, :foreign_key => 'foreignId'
  
  def read_attribute attr_name
    if attr_name.to_sym == :orderable_type
      self.class.write_polymorphic_type(super(:type))
    else
      super(attr_name)
    end
  end
  
  def write_attribute attr_name, attr_value
    if attr_name.to_sym == :orderable_type
      super(:type, self.class.read_polymorphic_type(attr_value))
    else
      super(attr_name, attr_value)
    end
  end
  
  def self.read_polymorphic_type type
    type.capitalize
  end
  
  def self.write_polymorphic_type type
    type.underscore
  end
  
end