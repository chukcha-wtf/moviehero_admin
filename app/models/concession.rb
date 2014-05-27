class Concession < ActiveRecord::Base
  self.table_name = 'concessionItem'
  self.inheritance_column = '_type'

  has_many :order_items, -> { where type: 'concession' }, :foreign_key => 'foreignId'
  belongs_to :circuit, :foreign_key => 'circuitId', :class_name => 'Circuit'
end