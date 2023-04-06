class Supplier < ApplicationRecord
  has_one :account, dependent: :nullify
  has_one :account_history, through: :account
end
