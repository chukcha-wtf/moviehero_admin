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

module ActiveRecord::Associations::Builder
  class HasMany < CollectionAssociation #:nodoc:

    def valid_options
      super + [:primary_key, :dependent, :as, :through, :source, :source_type, :inverse_of, :counter_cache, :foreign_type]
    end

  end
end

module ActiveRecord
  # = Active Record Reflection
  module Reflection # :nodoc:
    class AssociationReflection < MacroReflection #:nodoc:
      def initialize(macro, name, scope, options, active_record)
        super
        @collection = :has_many == macro
        @automatic_inverse_of = nil
        if options[:as] && options[:foreign_type]
          @type         = options[:foreign_type]
        else
          @type         = options[:as] && "#{options[:as]}_type"
        end
        @foreign_type = options[:foreign_type] || "#{name}_type"
        @constructable = calculate_constructable(macro, options)
      end
    end
  end
end

module ActiveRecord
  module Associations
    class AssociationScope #:nodoc:

      def add_constraints(scope, owner, assoc_klass, refl, tracker)
        chain = refl.chain
        scope_chain = refl.scope_chain

        tables = construct_tables(chain, assoc_klass, refl, tracker)

        chain.each_with_index do |reflection, i|
          table, foreign_table = tables.shift, tables.first

          if reflection.source_macro == :belongs_to
            if reflection.options[:polymorphic]
              key = reflection.association_primary_key(assoc_klass)
            else
              key = reflection.association_primary_key
            end

            foreign_key = reflection.foreign_key
          else
            key         = reflection.foreign_key
            foreign_key = reflection.active_record_primary_key
          end

          if reflection == chain.last
            bind_val = bind scope, table.table_name, key.to_s, owner[foreign_key], tracker
            scope    = scope.where(table[key].eq(bind_val))

            if reflection.type
              value    = owner.class.base_class.sti_name
              bind_val = bind scope, table.table_name, reflection.type.to_s, value, tracker
              scope    = scope.where(table[reflection.type].eq(bind_val))
            end
          else
            constraint = table[key].eq(foreign_table[foreign_key])

            if reflection.type
              value    = chain[i + 1].klass.base_class.sti_name
              bind_val = bind scope, table.table_name, reflection.type.to_s, value, tracker
              scope    = scope.where(table[reflection.type].eq(bind_val))
            end

            scope = scope.joins(join(foreign_table, constraint))
          end

          is_first_chain = i == 0
          klass = is_first_chain ? assoc_klass : reflection.klass

          # Exclude the scope of the association itself, because that
          # was already merged in the #scope method.
          scope_chain[i].each do |scope_chain_item|
            item  = eval_scope(klass, scope_chain_item, owner)

            if scope_chain_item == refl.scope
              scope.merge! item.except(:where, :includes, :bind)
            end

            if is_first_chain
              scope.includes! item.includes_values
            end

            scope.where_values += item.where_values
            scope.order_values |= item.order_values
          end
        end

        scope
      end
    end
  end
end