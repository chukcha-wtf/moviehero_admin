class BillingInformation < ActiveRecord::Base
  self.table_name = 'BillingInformation'
  self.inheritance_column = '_type'

  has_one :user, :foreign_key => 'billingInformationId'
end