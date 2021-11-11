class Supplier < User
  has_many :supplier_categories, dependent: :destroy
  has_many :categories, through: :supplier_categories
  has_many :products
end
