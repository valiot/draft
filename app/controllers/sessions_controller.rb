class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    # user = User.from_omniauth(env['omniauth.auth'], event)
    session[:user_id] = user.id
    # redirect_to edit_user_path
    redirect_to checkin_path
  end

  def checkin
    # user = User.from_omniauth(env['omniauth.auth'])
    # session[:user_id] = user.id
    @invitations = current_user.invitations.where(status: 1)
  end

  def new
    redirect_to checkin_path if current_user
    # redirect_to edit_user_path if current_user
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
