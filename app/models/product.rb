class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :supplier_category

  validates_presence_of :name, :description, :sku
  validates_uniqueness_of :sku

  class << self
    def search(opts = {})
      opts ||= {}

      products = Product.all

      if opts[:query].present?
        products = products.where("
          lower(name) ILIKE :query OR 
          lower(sku) ILIKE :query OR 
          lower(description) ILIKE :query
        ", query: "%#{opts[:query].to_s.downcase}%")
      end

      if opts[:category_ids].present?
        products = products.where(supplier_category_id: opts[:category_ids])
      end

      products
    end
  end
end
