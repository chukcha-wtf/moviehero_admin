class RegisterStation < ActiveRecord::Base
  self.table_name = 'RegisterStation'
  self.inheritance_column = '_type'

  belongs_to :circuit, :foreign_key => 'circuitId', :class_name => 'Circuit'
  belongs_to :site, :foreign_key => 'siteId', :class_name => 'Site'

end