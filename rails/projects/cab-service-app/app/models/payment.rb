class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :driver



  validates :amount, :payment_method,  presence:true
  validates :payment_method, inclusion: {in: %w(card cash upi)}
end
