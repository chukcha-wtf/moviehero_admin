class Card < ActiveRecord::Base
  self.table_name = 'card'
  self.inheritance_column = '_type'


  has_one :user, :foreign_key => 'cardId', :class_name => 'User'
end