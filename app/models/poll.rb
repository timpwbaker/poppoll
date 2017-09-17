class Poll < ApplicationRecord

  validates :question, presence: true

  belongs_to :user
  has_many :options, inverse_of: :poll, dependent: :destroy

  accepts_nested_attributes_for :options

  def notify_client_side
    options.each do |option|
      ActionCable.server.broadcast "poll_notifications_channel", option_id: option.id, votes_cast: option.vote_count
    end
  end
end
