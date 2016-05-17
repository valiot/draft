class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  before_create :generate_token

  private

  def generate_token
    begin
      self.token = SecureRandom.hex
    end while self.class.exists?(token: token)
  end
end
