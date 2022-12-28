class ProductCategory < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :cookings, dependent: :destroy
end
