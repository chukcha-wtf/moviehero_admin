class Movie < ActiveRecord::Base
  self.table_name = 'Movie'

  has_many :showings, :foreign_key => 'movieId'
  belongs_to :studio, :foreign_key => 'studioId'
end