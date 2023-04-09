class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true



  validates :url, :imageable_type, :imageable_id, presence: true
end
