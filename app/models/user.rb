class User < ApplicationRecord
  belongs_to :profile
  has_many :invitations
  has_many :checkins

  enum gender: [:male, :female]
  enum shirt_size: [:xs, :s, :m, :l, :xl, :xxl]
end
