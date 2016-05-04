class User < ApplicationRecord
  belongs_to :profile
  has_many :invitations
  has_many :checkins

  enum shirt_size: [:xs, :s, :m, :l, :xl, :xxl]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.profile = user.profile || Profile.create
      user.email = auth.info.email
      user.name = auth.info.name
      user.image_url = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
