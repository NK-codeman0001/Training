class DeleteProductsCallbacks
  def self.before_destroy(p)
    puts "Before Destroy for DeleteProductCallback"
  end

  def self.after_destroy(p)
    puts "After Destroy for DeleteProductCallback"
  end
end

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

  # before_create :set_default_values, if: [:title_is_empty?, :price_is_nil?]

  # around_create  :add_title

  # after_create :add_title_2
  
  before_update :update_time

  after_update :print_after_update

  around_destroy :log_delete
  
  after_commit :log_commit

  after_rollback :log_rollback

  after_initialize :log_initialization
  after_find :log_quering
  after_touch :log_touch


  after_save :add_title_2, if: :title_is_empty?

  before_save :log_multiple_conditional, if: [:title_is_empty?, :price_is_nil?]

  after_create_commit :log_after_create_commit
  after_update_commit :log_after_update_commit
  after_destroy_commit :log_after_destroy_commit

  after_destroy DeleteProductsCallbacks, if: :price_is_nil?
  before_destroy DeleteProductsCallbacks, if: :price_is_nil?



  private

  def log_after_create_commit
    puts "Commit for Create"
  end

  def log_after_update_commit
    puts "Commit for Update"
  end

  def log_after_destroy_commit
    puts "Commit for Destroy"
  end

  def log_multiple_conditional
    puts "Multiple Conditonal Callback had been called"
  end

  def price_is_nil?
    self.price.nil?
  end

  def title_is_empty?
    self.title.nil?
  end

  def log_touch
    puts "object had been touched"
  end

  def log_initialization
    puts "object had been initialized"
  end

  def log_quering
    puts "record had been fetched from database"
  end

  def log_rollback
    puts "WARNING: TRANSITION FAILED"
  end

  def log_commit
    puts "Transition had been committed"
  end

  def log_delete
    puts "#{self.title} is logged"
    yield
    puts "id: #{self.id} deleted"

  end

  def print_after_update
    puts "After Update Callback"
  end

  def update_time
    puts "Updated"
    self.updated_at = Time.now.utc
  end

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
