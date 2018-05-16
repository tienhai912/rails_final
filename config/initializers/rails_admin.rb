RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with do
    unless current_user.admin
      byebug
      flash[:danger] = t "common.be_admin"
      redirect_to main_app.root_path
    end
  end

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
    exclude_fields :order_items, :orders, :promotions, :product_promotions
    # field :image, :refile do
    #   pretty_value do
    #     if (bindings[:object].image)
    #       bindings[:view].image_tag bindings[:view].attachment_url(bindings[:object], :image, :fill, 100, 100)
    #     end
    #   end
    # end
  end

  config.model "Promotion" do
    exclude_fields :product_promotions
  end

  config.model "Order" do
    exclude_fields :order_items
  end

  config.actions do
    dashboard                     # mandatory
    index do
      only ["User", "Product", "Order", "Review", "Promotion"]
    end                         # mandatory

    new do
      only ["Product", "Promotion"]
    end
    # export
    bulk_delete do
      only ["User", "Product", "Order", "Review", "Promotion"]
    end
    show
    edit do
      only ["Product", "Promotion"]
    end
    delete do
      only ["User", "Product", "Order", "Review", "Promotion"]
    end
    show_in_app do
      only ["Product", "Review", "Promotion"]
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
