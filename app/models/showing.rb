class Showing < ActiveRecord::Base
  self.table_name = 'showing'

  belongs_to :movie, :foreign_key => 'movieId'
  belongs_to :screen, :foreign_key => 'screenId'

  has_many :tickets, :foreign_key => 'showingId'
end