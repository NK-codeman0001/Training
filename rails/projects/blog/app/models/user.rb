class User < ApplicationRecord
  validates :name, presence: true
  validates :terms_and_conditions, acceptance: { message: 'must be abided'}
end
