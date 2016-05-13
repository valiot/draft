class Team < ApplicationRecord
  belongs_to :event
  has_many :attendees
  has_many :users, through: :attendees
end
