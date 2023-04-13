class Blog < ApplicationRecord
  validates :title, presence: true, length: {maximum: 60}
  validates :body, presence: true, length: {maximum: 255}
  validates :published_at, comparison: {greater_than_or_equal_to: Time.now, message: "can't be in past"}, allow_nil: true
  
  scope :draft, -> { where(published_at: nil)}
  scope :published, -> { where("published_at <= ?", Time.now) }
  scope :scheduled, -> { where("published_at > ?", Time.now)}
end
