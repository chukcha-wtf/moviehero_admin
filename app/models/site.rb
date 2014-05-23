class Site < ActiveRecord::Base
  self.table_name = 'SITE'

  belongs_to :circuit, :foreign_key => 'circuitId', :class_name => 'Circuit'
  has_many :register_stations, :foreign_key => 'siteId', :class_name => 'RegisterStation'
  has_many :screens, :foreign_key => 'siteId'
end