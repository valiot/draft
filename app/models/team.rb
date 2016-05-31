class Team < ApplicationRecord
  belongs_to :event
  has_many :attendees
  has_many :users, through: :attendees

  def leader
    attendees.first.user if attendees.first # FIXME
  end
end
