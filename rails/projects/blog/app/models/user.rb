class CountryValidator < ActiveModel::Validator 
  def validate(record)
    @ban_country = %w(pakistan russia china)
    @i_country = record.country.downcase.strip

    if @ban_country.include?(@i_country)
      record.errors.add :base, "Users from #{@i_country.capitalize} are not banned"
    elsif @i_country.empty?
      record.errors.add :base, "Country field can't be empty"
    end
  end
end

class User < ApplicationRecord
  validates :name, presence: true #, format: {with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
  validates :terms_and_conditions, acceptance: { message: 'must be abided'}
  validates :email, confirmation: true, uniqueness: { case_sensitive: false }
  validates :email_confirmation, presence: true
  validates :age, numericality: {only_integer: true,greater_than_or_equal_to: 18, less_than_or_equal_to: 25, other_than: 20}
  # validates :country, exclusion: {  in: %w(pakistan russia china), message: "%{value} of %{attribute} for %{model} is reserved."}
  validates :t_size, inclusion: {in: %w(small medium large xl xxl xxxl)}
  validates :password, length: {in: 8..16}
  validates_with CountryValidator
  validates_each :name, :country do |record, attr, value|
    record.errors.add(attr, "must be letter only") if !(value =~/[a-zA-Z]/)
  end
end

