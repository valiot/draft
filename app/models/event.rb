class Event < ApplicationRecord
  has_many :invitations
  has_many :attendees
  has_many :teams
  # has_many :users, through: :invitations
  attachment :image
end
