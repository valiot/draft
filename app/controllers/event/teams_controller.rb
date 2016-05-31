class Event::TeamsController < ApplicationController
  def draft
    @attendees = current_event.attendees.where(team: nil)
    @teams = Team.all
  end

  def select
    @attendees = current_event.attendees.where(team: nil)
    @next_user = next_user
    @teams = Team.all
    @turns = turns
  end

  def pick
    respond_to do |format|
      if attendee.update(team: team)
        flash.now[:notice] = 'Tu elección de equipo ha sido guardada.'
        format.js
        redirect_to event_logout_path
      else
        format.html { render invitations_path }
        format.json { render json: attendee.errors, team: :unprocessable_entity }
      end
    end
  end

  private

  def attendee
    @attendee = Attendee.find_by(user: current_user, event: current_event)
  end

  def team
    @team = Team.find(params[:id])
  end

  def next_user
    event_attendees.first.user
  end

  def event_attendees
    current_event.attendees.where(team: nil).order(:created_at)
  end

  def turns
    event_attendees.map { |e| e.user.id }.find_index(current_user.id)
  end
end
