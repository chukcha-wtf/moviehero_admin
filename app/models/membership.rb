class Membership < ActiveRecord::Base
  self.table_name = 'Membership'

  belongs_to :user
end