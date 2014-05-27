class User < ActiveRecord::Base
  self.table_name = 'user'

  belongs_to :mailing_address, :class_name => 'Address', :dependent => :destroy, :foreign_key => 'mailingAddressId'
  belongs_to :billing_information, :class_name => 'BillingInformation', :dependent => :destroy, :foreign_key => 'billingInformationId'
  belongs_to :membership_card, :class_name => 'Card', :dependent => :destroy, :foreign_key => 'cardId'
  belongs_to :employee_circuit, :class_name => 'Circuit', :inverse_of => :users, :foreign_key => 'circuitId'

  has_one :owned_membership, :class_name => 'Membership', :foreign_key => 'ownerId'

  has_many :orders, :foreign_key => 'userId'
  has_many :tickets, :foreign_key => 'memberId'

end