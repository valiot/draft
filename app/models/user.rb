class User < ApplicationRecord
  belongs_to :profile, required: false
  has_many :invitations
  has_many :accepted_invitations, -> { where(status: :accepted) }, class_name: 'Invitation'
  has_many :attendees

  enum shirt_size: [:s, :m, :l, :xl]
  enum role: [:user, :admin]

  attachment :avatar, type: :image

  def picture_url
    return avatar_url unless avatar_id.blank?
    return image_url unless image_url.blank?
    'http://placehold.it/500x500?text=Profile+Picture'
  end

  def pending_invitations?
    invitations.where(status: :pending).count > 0
  end

  def self.from_omniauth(auth)
    existing_user = User.find_by(email: auth.info.email)
    current_event = Event.last # TODO DELETE
    if existing_user
      Invitation.find_or_create_by(event: current_event, user: existing_user)
      return existing_user
    end
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.image_url = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires
      user.invitations << Invitation.create(event: current_event)
      user.save!
    end
  end
end
