class Showing < ActiveRecord::Base
  self.table_name = 'Showing'

  belongs_to :movie, :foreign_key => 'movieId'
  belongs_to :screen, :foreign_key => 'screenId'

  has_many :tickets, :foreign_key => 'showingId'
end