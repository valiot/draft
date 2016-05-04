class Event < ApplicationRecord
  has_many :invitations
  has_many :checkins
  has_many :teams
  # has_many :users, through: :invitations
  # has_many :attendies, through: :checkins (users)
end
