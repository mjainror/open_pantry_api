class SupplierCategory < ApplicationRecord
  belongs_to :supplier
  belongs_to :category

  has_many :products
end
