class Category < ApplicationRecord
  has_many :supplier_categories, dependent: :destroy
  has_many :suppliers, through: :supplier_categories
end
