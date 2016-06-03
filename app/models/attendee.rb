class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :team, required: false
  after_update :notify_update
  after_create :notify_create

  private

  def notify_create
    ActionCable.server.broadcast "draft", {action: "create_attendee", user_id: user.id, picture_url: user.picture_url, name: user.name}
  end

  def notify_update
    ActionCable.server.broadcast "draft", {action: "update_draft", user_id: user.id, team_id: team&.id}
    ActionCable.server.broadcast "draft", {action: "update_turn"}
  end

  def event_attendees
    event.attendees.where(team: nil).order(:created_at)
  end

  def turn
    event_attendees.map { |e| e.user.id }.find_index(current_user.id)
  end
end
