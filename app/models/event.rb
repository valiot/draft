class Event < ApplicationRecord
  before_create :generate_slug
  has_many :invitations
  has_many :attendees
  has_many :teams
  has_many :users, through: :attendees
  has_many :invited_users, through: :invitations, class_name: 'User', source: :user
  attachment :image
  attachment :agenda_image

  after_update :send_review_mail, if: :review?

  def to_param
    slug
  end

  def self.find(input)
    if input.is_a?(Integer)
      super
    else
      find_by(slug: input)
    end
  end

  private

  def send_review_mail
    users.each do |u|
      ReviewMailer.review_invite(u, self).deliver_later
    end
  end

  def generate_slug
    self.slug = name.parameterize
  end
end
