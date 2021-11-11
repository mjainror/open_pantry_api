class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :supplier_category

  validates_presence_of :name, :description, :sku
  validates_uniqueness_of :sku
end
