module Svpply
  class ProductCollection
    attr_reader :products_count, :products

    def initialize(response)
      @products = response["products"].map { |p| Product.new(p) }
      @products_count = response["products_count"]
      self
    end
  end
end
