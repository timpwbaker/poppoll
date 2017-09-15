class Option < ApplicationRecord
  belongs_to :poll

  validates :body, presence: true

  def self.add_vote(id)
    self.increment_counter(:vote_count, id)
  end
end
