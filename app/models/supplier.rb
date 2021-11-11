class Supplier < User
  has_many :supplier_categories, dependent: :destroy
  has_many :categories, through: :supplier_categories
  has_many :products

  accepts_nested_attributes_for :supplier_categories
end
