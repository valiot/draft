class Team < ApplicationRecord
  belongs_to :event
  has_many :attendees
  has_many :users, through: :attendees

  def leader
    attendees.first.user if attendees.first # FIXME
  end

  def has_available_profile(profile)
    profiles[profile].present? && profiles[profile] > 0
  end

  def substract_profile(profile)
    profiles[profile] -= 1
  end
end
