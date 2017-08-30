class User < ApplicationRecord

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validate :email_is_unique

  has_many :polls

  def email_is_unique
    if User.find_by_email(email)
      errors.add(:email, "This email address is already taken")
    end
  end

end
