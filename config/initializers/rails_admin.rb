RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.main_app_name = ["Laptop World", "Admin page"]

  config.model "Product" do
    exclude_fields :order_items, :orders
  end

  config.model "Order" do
    list do
      exclude_fields :order_items
    end
  end

  config.actions do
    dashboard                     # mandatory
    index do
      only ["User", "Product", "Order", "Review"]
    end                         # mandatory

    new do
      only ["User", "Product"]
    end
    # export
    bulk_delete do
      only ["User", "Product", "Order", "Review"]
    end
    show
    edit do
      only ["Product"]
    end
    delete do
      only ["User", "Product", "Order", "Review"]
    end
    show_in_app do
      only ["Product", "Review"]
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
