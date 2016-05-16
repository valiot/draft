class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth']) || User.find_by_email(params[:email])
    session[:user_id] = user.id
    redirect_to edit_user_path
  end

  def new
    if current_user
      redirect_to edit_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
