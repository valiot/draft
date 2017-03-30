class SessionsController < ApplicationController
  def create
    slug = env.dig('omniauth.params', 'event') || params[:event]
    @event = Event.find_by(slug: slug)
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_decisions
  end

  def new
    redirect_to edit_user_path if current_user
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
