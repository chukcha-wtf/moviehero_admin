class Screen < ActiveRecord::Base
  self.table_name = 'screen'

  has_many :showings, :foreign_key => 'screenId'
  has_many :ticket_numbers, :foreign_key => 'screenId'

  belongs_to :site, :foreign_key => 'siteId'
end