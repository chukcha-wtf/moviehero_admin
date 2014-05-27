class Circuit < ActiveRecord::Base
  self.table_name = 'circuit'

  has_many :sites, :foreign_key => 'circuitId', :class_name => 'Site'
  has_many :register_stations, :foreign_key => 'circuitId', :class_name => 'RegisterStation'
  has_many :users, :foreign_key => 'circuitId', :class_name => 'User'
  has_many :concessions, :foreign_key => 'circuitId'
end