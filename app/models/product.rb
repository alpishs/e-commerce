class Product < ApplicationRecord
  belongs_to :category
  belongs_to :cart

  validates :name, :uniqueness => true
end
