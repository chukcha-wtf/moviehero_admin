RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  # User
  config.model 'User' do
    navigation_label 'Users'
  end
  config.model 'Address' do
    navigation_label 'Users'
  end
  config.model 'BillingInformation' do
    navigation_label 'Users'
  end
  config.model 'Card' do
    navigation_label 'Users'
  end
  config.model 'Membership' do
    navigation_label 'Users'
  end

  # Movies
  config.model 'Movie' do
    navigation_label 'Movies'
  end
  config.model 'Showing' do
    navigation_label 'Movies'
  end
  config.model 'Screen' do
    navigation_label 'Movies'
  end
  config.model 'Studio' do
    navigation_label 'Movies'
  end

  # Orders
  config.model 'Order' do
    navigation_label 'Orders'
  end
  config.model 'Ticket' do
    navigation_label 'Orders'
  end
  config.model 'RegisterStation' do
    navigation_label 'Orders'
  end
  config.model 'TicketNumber' do
    navigation_label 'Orders'
  end
  config.model 'OrderItem' do
    navigation_label 'Orders'
    list do
      field :id
      field :type
      field :price
      field :description
      field :orderable
    end
    edit do
      field :description
      field :price
      field :type
      field :foreignId
      field :orderable do
        visible false
      end
    end
  end
  config.model 'Payment' do
    navigation_label 'Orders'
  end
  config.model 'Concession' do
    navigation_label 'Orders'
  end
  config.model 'ConcessionCategory' do
    navigation_label 'Orders'
  end

  # Movie Theatres
  config.model 'Site' do
    navigation_label 'Movie Theatres'
  end
  config.model 'Circuit' do
    navigation_label 'Movie Theatres'
  end




end

require 'rails_admin/adapters/active_record'

class RailsAdmin::Adapters::ActiveRecord::Association
  def model_lookup_with_hack
    if name == :orderable && model.name == "OrderItem"
      [Ticket, Membership, Concession]
    else
      model_lookup_without_hack
    end
  end

  alias_method_chain :model_lookup, :hack
  
end