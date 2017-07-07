class User < ApplicationRecord
  has_secure_password
  has_many :addresses
  has_one  :cart
  has_many :orders

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :contact_number, presence: true, uniqueness: true, length: { is: 10 }
  validate  :validate_date_of_birth

  private

  def validate_date_of_birth
    errors.add(:date_of_birth, 'must be a valid date') if date_of_birth > Time.zone.today
  end

end