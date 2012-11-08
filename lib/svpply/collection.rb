module Svpply
  class Collection
    attr_reader :id, :title, :masthead, :masthead_height, :masthead_width, :preview_type,
        :preview_image, :representative_item_id, :representative_item_width, :representative_item_height,
        :products_count, :is_private, :is_wishlist, :date_created, :date_updated, :creator, :svpply_url

    def self.find(id)
      new(Client.get_response("/collections/#{id}.json")["collection"])
    end

    def self.products(id, attrs=nil)
      ProductCollection.new(Client.get_response("/collections/#{id}/products.json", attrs)).products
    end

    def initialize(hash)
      @id = hash["id"]
      @title = hash["title"]
      @masthead = hash["masthead"]
      @masthead_height = hash["masthead_height"]
      @masthead_width = hash["masthead_width"]
      @preview_type = hash["preview_type"]
      @preview_image = hash["preview_image"]
      @representative_item_id = hash["representative_item_id"]
      @representative_item_height = hash["representative_item_height"]
      @representative_item_width = hash["representative_item_width"]
      @products_count = hash["products_count"]
      @is_private = hash["is_private"]
      @is_wishlist = hash["is_wishlist"]
      @date_created = hash["date_created"]
      @date_updated = hash["date_updated"]
      @creator = hash["creator"]
      @creator["portrait"] = @creator["avatar"].gsub("avatars", "portraits")
      @svpply_url = "https://svpply.com/collections/#{@id}"
    end

  end
end