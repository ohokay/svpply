module Svpply
  class Category
    attr_reader :name, :url, :children, :api_url

    def self.all
      CategoryCollection.new(Client.get_response('/shop/categories.json')).categories
    end

    def initialize(hash)
      @name = hash["name"]
      @url = hash["url"]
      @children = hash["children"].nil? ? [] : hash["children"].map { |c| Category.new(c) }
      @api_url = @url[25, 1000]
      self
    end

    def products(attrs=nil)
      ProductCollection.new(Client.get_response(@api_url, attrs)).products
    end

  end
end
