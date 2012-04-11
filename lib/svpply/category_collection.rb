module Svpply
  class CategoryCollection
    attr_reader :categories

    def initialize(response)
      @categories = response["categories"][0]["children"].map { |c| Category.new(c) }
      self
    end
  end
end

