class Event::AttendeesController < Event::ApplicationController
  def new
  end

  def create
    if Attendee.create(user: current_user, event: current_event)
      session[:user_id] = nil
      redirect_to event_main_path
    else
      render event_checkin_path
    end
  end
end
