module Svpply
  class Product
    attr_reader :id, :title, :price, :formatted_price, :currency_code,
        :discount, :discount_code, :category, :categories, :gender, :image,
        :image_height, :image_width, :saves, :notes, :status_id,
        :date_created, :date_updated, :url, :svpply_url

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
      @id = hash["id"]
      @title = hash["page_title"]
      @price = hash["price"]
      @formatted_price = hash["formatted_price"]
      @currency_code = hash["currency_code"]
      @discount = hash["discount"]
      @discount_code = hash["discount_code"]
      @category = hash["category"]
      @categories = hash["categories"]
      @gender = hash["gender"]
      @image = hash["image"]
      @image_width = hash["image_width"]
      @image_height = hash["image_height"]
      @saves = hash["saves"]
      @notes = hash["notes"]
      @status_id = hash["status_id"]
      @url = hash["page_url"]
      @date_created = hash["date_created"]
      @date_updated = hash["date_updated"]
      @svpply_url = "https://svpply.com/item/#{@id}"
    end
  end
end