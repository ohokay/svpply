require 'httparty'
require "svpply/version"
require "svpply/client"
require "svpply/product"
require "svpply/product_collection"
require "svpply/category"
require "svpply/category_collection"
require "svpply/store"

module Svpply
  def self.products(*attributes)
    Product.products(attributes)
  end

  def self.product(id)
    Product.find(id)
  end

  def self.product_image_permalink(id, type)
    Product.product_image_permalink(id, type)
  end

  def self.categories
    Category.all
  end

  def self.store(id)
    Store.find(id)
  end

  def self.store_products(id, *attributes)
    Store.products(id, attributes)
  end

end
