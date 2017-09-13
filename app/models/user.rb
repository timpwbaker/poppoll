class User < ApplicationRecord

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validate :email_is_unique

  has_many :polls

  def self.guest
    find_by_name("Anonymous") || new_guest
  end

  def self.new_guest
    user = new(
      name: "Anonymous",
      email: "mr_a@nonymous.com",
      password: "$2a$10$bGCYIJXXJGtibD05tw495Os",
      password_confirmation: "$2a$10$bGCYIJXXJGtibD05tw495Os",
    )
    user.save
    user
  end
  private_class_method :new_guest

  def email_is_unique
    if User.find_by_email(email)
      errors.add(:email, "This email address is already taken")
    end
  end

end
