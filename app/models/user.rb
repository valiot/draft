class User < ApplicationRecord
  belongs_to :profile, required: false
  has_many :invitations
  has_many :attendees

  enum shirt_size: [:s, :m, :l, :xl]
  enum role: [:user, :admin]

  attachment :avatar, type: :image

  def picture_url
    return avatar_url if avatar_id
    return image_url if image_url
    'http://placehold.it/500x500?text=Profile+Picture'
  end

  def pending_invitations?
    invitations.where(status: :pending).count > 0
  end

  def self.from_omniauth(auth)
    existing_user = User.find_by(email: auth.info.email)
    return existing_user if existing_user
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.image_url = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires
      user.invitations << Invitation.create(event_id: 1) # TODO DELETE
      user.save!
    end
  end
end
