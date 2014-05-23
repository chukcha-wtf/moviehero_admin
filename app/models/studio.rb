class Studio < ActiveRecord::Base
  self.table_name = 'Studio'

  has_many :movies, foreign_key: 'studioId'
end