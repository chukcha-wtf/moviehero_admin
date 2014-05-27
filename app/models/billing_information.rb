class BillingInformation < ActiveRecord::Base
  self.table_name = 'billingInformation'
  self.inheritance_column = '_type'

  has_one :user, :foreign_key => 'billingInformationId'
end