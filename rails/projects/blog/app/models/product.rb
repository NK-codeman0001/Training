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

  # before_save :add_title

  # def add_title
  #   self.title = self.name.titleize + " " + self.brand_name.titleize
  # end

  # around_save :add_title

  # before_create :set_default_values

  # around_create  :add_title

  after_create :add_title_2
  
  private 
  def add_title
    self.title = self.name.titleize 
    puts self.title, "Before Save"
    yield
    self.title += " " + self.brand_name.titleize
    puts self.title, "After Save"
  end

  def add_title_2
    self.title = self.name.titleize + " " + self.brand_name.titleize
  end

  def set_default_values
    puts "Before Create"
    self.name = ""
    self.brand_name = ""
    self.title = ""
    self.price = 0
  end






end
