class Product < ApplicationRecord
  validates :name, :brand_name, presence: true
  
  # before_create do
  #   self.name = self.name.downcase
  #   self.brand_name = self.brand_name.downcase
  # end

  # after_validation :downcase_name_and_brand_name

  # def downcase_name_and_brand_name
  #   self.name = self.name.downcase
  #   self.brand_name = self.brand_name.downcase
  # end


  before_validation :downcase_name_and_brand_name

  def downcase_name_and_brand_name
    self.name = self.name.downcase
    self.brand_name = self.brand_name.downcase
  end


end
