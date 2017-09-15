class User < ApplicationRecord

  has_secure_password
  store_accessor :votes

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :polls

  def self.guest
    find_by_email("guest@pop-poll.herokuapp.com") || new_guest
  end

  def self.new_guest
    user = new(
      name: "Anonymous",
      email: "guest@pop-poll.herokuapp.com",
      password: "$2a$10$bGCYIJXXJGtibD05tw495Os",
      password_confirmation: "$2a$10$bGCYIJXXJGtibD05tw495Os",
    )
    user.save
    user
  end
  private_class_method :new_guest

  def store_vote(option)
    self.votes[option.poll.id.to_s] = option.id
    self.save
  end

  def voted?(poll)
    self.votes[poll.id.to_s].present?
  end

end
