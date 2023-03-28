class User < ApplicationRecord
  validates :name, presence: true, format: {with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
  validates :terms_and_conditions, acceptance: { message: 'must be abided'}
  validates :email, confirmation: true
  validates :email_confirmation, presence: true
  validates :age, comparison: {greater_than_or_equal_to: 18, less_than_or_equal_to: 25, other_than: 20}
  validates :country, exclusion: {  in: %w(pakistan russia china), message: "%{value} of %{attribute} for %{model} is reserved."}
  validates :t_size, inclusion: {in: %w(small medium large xl xxl xxxl)}
end
