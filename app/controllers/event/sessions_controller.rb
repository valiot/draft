class Event::SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to event_checkin_url(current_event)
  end

  def new
    redirect_to event_checkin_path if current_user
  end

  def destroy
    session[:user_id] = nil
    redirect_to event_main_path
  end
end
