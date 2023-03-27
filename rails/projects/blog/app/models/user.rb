class User < ApplicationRecord
  validates :name, presence: true
  validates :terms_and_conditions, acceptance: { message: 'must be abided'}
  validates :email, confirmation: true
  validates :email_confirmation, presence: true
  validates :age, comparison: {greater_than_or_equal_to: 18, less_than_or_equal_to: 25, other_than: 20}
  validates :country, exclusion: {  in: %w(pakistan russia china), message: "%{value} of %{attribute} for %{model} is reserved."}
end
