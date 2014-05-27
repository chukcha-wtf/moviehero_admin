class Membership < ActiveRecord::Base
  self.table_name = 'membership'

  belongs_to :user
end