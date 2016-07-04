class Event::AttendeesController < ApplicationController
  def new
    if Attendee.find_by(user: current_user).nil?
      Attendee.find_by(user_id: current_user.id)
    else
      redirect_to event_select_path
    end
  end

  def create
    if Attendee.create(user: current_user, event: current_event)
      session[:user_id] = nil
      flash[:notice] = 'Tu check-in ha quedado registrado.'
      respond_to do |format|
        format.js
      end
    else
      render event_main_path
    end
  end
end
