class Product < ApplicationRecord
  validates :product_name,
            presence: true,
            length: { maximum: 30 },
            uniqueness: { case_sensitive: true }

  # TODO: なにこれ？
  # validates :product_number,
  #           presence: true,
  #           numericality: { only_integer: true },
  #           length: { maximum: 10 },
  #           uniqueness: { case_sensitive: true }

  # validates :page,
  #           numericality: { only_integer: true }

  # validates :discontinued,
  #           inclusion: { in: [true, false] }

  # validates :unit_name,
  #           presence: true

  # validates :price,
  #           numericality: { only_integer: true }

  # validates :unit,
  #           presence: true,
  #           numericality: { only_integer: true }
  belongs_to :product_category
  belongs_to :cooking_category
  has_one_attached :image
  has_many :cooking_product_relations, dependent: :destroy
  has_many :cookings, through: :cooking_product_relations
end
