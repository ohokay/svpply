module Svpply
  class Product
    attr_reader :title, :price, :category, :gender, :image,
        :image_height, :image_width, :id, :saves, :notes, :url, :svpply_url

    def self.products(attrs=nil)
      unless attrs.empty?
        ProductCollection.new(Client.get_response('/products/search.json', attrs)).products
       else
        ProductCollection.new(Client.get_response('/shop.json')).products
       end
    end

    def self.find(id)
      new(Client.get_response("/products/#{id}.json")["product"])
    end

    def initialize(hash)
      @title = hash["page_title"]
      @price = hash["price"]
      @category = hash["category"]
      @gender = hash["gender"]
      @image = hash["image"]
      @image_width = hash["image_width"]
      @image_height = hash["image_height"]
      @id = hash["id"]
      @saves = hash["saves"]
      @notes = hash["notes"]
      @url = hash["page_url"]
      @svpply_url = "https://svpply.com/item/#{@id}"
    end
  end
end
