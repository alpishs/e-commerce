class Category < ApplicationRecord
    has_many :products
    self.inheritance_column = ["Mirrorless", "full frame", "point and shoot"]
end
