module Supports
  class ProductSupport
    attr_reader :products, :param

    def initialize arg
      @products = arg[:products]
      @param = arg[:param]
    end

    def products_search
      search.result.page(param[:page]).per_page Settings.products.show_limit
    end

    def search
      products.ransack param[:q]
    end
  end
end
