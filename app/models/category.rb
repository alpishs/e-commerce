class Category < ApplicationRecord
    has_many :products
    validates :name, :uniqueness => true

    self.inheritance_column = ["Mirrorless", "full frame", "point and shoot"]
end
