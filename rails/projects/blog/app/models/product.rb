class Product < ApplicationRecord
  validates :name, :brand_name, presence: true
  before_create do
    self.name = self.name.downcase
    self.brand_name = self.brand_name.downcase
  end
end
