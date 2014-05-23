module ActiveRecord
  # = Active Record Belongs To Polymorphic Association
  module Associations
    class BelongsToPolymorphicAssociation < BelongsToAssociation #:nodoc:
      def klass
        type = owner[reflection.foreign_type]
        type.presence && type.capitalize.constantize
      end

      private

        def replace_keys(record)
          super
          owner[reflection.foreign_type] = record.class.base_class.sti_name
        end
    end
  end
end


class ActiveRecord::Base 
  def self.sti_name
    name.downcase
  end
end