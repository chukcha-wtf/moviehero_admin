class Studio < ActiveRecord::Base
  self.table_name = 'studio'

  has_many :movies, foreign_key: 'studioId'
end