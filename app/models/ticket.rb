class Ticket < ActiveRecord::Base
  self.table_name = 'ticket'
  self.inheritance_column = '_type'

  # has_many :order_items, -> { where type: 'ticket' }, :foreign_key => 'foreignId'
  # has_many :order_items, as: :orderable, :foreign_key => 'foreignId', :foreign_type => 'type'
  has_many :ticket_numbers, :foreign_key => 'ticketId', :class_name => 'TicketNumber'
  has_many :order_items, -> {
    where(type: 'ticket')
  }, :foreign_key => 'foreignId'

  belongs_to :showing, :foreign_key => 'showingId'
  belongs_to :memebr, :foreign_key => 'memberId', :class_name => 'User'
end