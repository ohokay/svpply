module Svpply
  class User
    attr_reader :id, :name, :username, :url, :description,
        :location, :display_name, :avatar, :gender_preference,
        :products_count, :owns_count,
        :users_following_count, :users_followers_count,
        :stores_following_count, :searches_following_count,
        :date_created, :date_updated, :svpply_url

    def self.find(id)
      new(Client.get_response("/users/#{id}.json")["user"])
    end

    def self.products(id, attrs=nil)
      ProductCollection.new(Client.get_response("/users/#{id}/wants/products.json", attrs)).products
    end

    def initialize(hash)
      @id = hash["id"]
      @name = hash["name"]
      @username = hash["username"]
      @url = hash["url"]
      @description = hash["description"]
      @location = hash["location"]
      @display_name = hash["display_name"]
      @avatar = hash["avatar"]
      @gender_preference = hash["gender_preference"]
      @products_count = hash["products_count"]
      @owns_count = hash["owns_count"]
      @users_following_count = hash["users_following_count"]
      @users_followers_count = hash["users_followers_count"]
      @stores_following_count = hash["stores_following_count"]
      @searches_following_count = hash["searches_following_count"]
      @date_created = hash["date_created"]
      @date_updated = hash["date_updated"]
      @svpply_url = "https://svpply.com/#{@username}"
    end

  end
end