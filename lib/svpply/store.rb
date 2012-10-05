module Svpply
  class Store
    attr_reader :id, :name, :slug, :url, :avatar, :description,
        :products_count, :collections_count, :users_followers_count, :locations_count,
        :masthead, :masthead_height, :masthead_width,
        :date_created, :date_updated, :svpply_url

    def self.find(id)
      new(Client.get_response("/stores/#{id}.json")["store"])
    end

    def initialize(hash)
      @id = hash["id"]
      @name = hash["name"]
      @slug = hash["slug"]
      @avatar = hash["avatar"]
      @description = hash["description"]
      @products_count = hash["products_count"]
      @collections_count = hash["collections_count"]
      @users_followers_count = hash["users_followers_count"]
      @locations_count = hash["locations_count"]
      @masthead = hash["masthead"]
      @masthead_height = hash["masthead_height"]
      @masthead_width = hash["masthead_width"]
      @date_created = hash["date_created"]
      @date_updated = hash["date_updated"]
      @svpply_url = "https://svpply.com/#{@slug}"
    end

  end
end