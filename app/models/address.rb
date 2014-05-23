class Address < ActiveRecord::Base
  self.table_name = 'address'

  has_one :user, :foreign_key => 'mailingAddressId'
end