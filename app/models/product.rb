class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :supplier_category
end
