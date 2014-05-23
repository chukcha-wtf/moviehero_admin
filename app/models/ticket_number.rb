class TicketNumber < ActiveRecord::Base
  self.table_name = 'TicketNumber'
  self.primary_key = 'ticketNumber'
  
  belongs_to :ticket, :foreign_key => 'ticketId'
  belongs_to :screen, :foreign_key => 'screenId'
end