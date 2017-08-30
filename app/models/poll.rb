class Poll < ApplicationRecord

  validates :question, presence: true

  belongs_to :user
end
