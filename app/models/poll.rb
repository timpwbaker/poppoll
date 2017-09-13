class Poll < ApplicationRecord

  validates :question, presence: true

  belongs_to :user
  has_many :options, inverse_of: :poll, dependent: :destroy

  accepts_nested_attributes_for :options
end
