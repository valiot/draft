class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_login
    redirect_to event_main_url unless current_user
  end

  def redirect_decisions
    # Existe el evento y ya tienes equipo
    if @event && Team.find_by(user: current_user, event: @event)
      redirect_to event_review_path
    # Existe el evento y ya hiciste checkin
    elsif @event && Attendee.find_by(user: current_user, event: @event)
      redirect_to event_select_path(@event)
    # Existe el evento y ya aceptace la invitation
    elsif @event && Invitation.find_by(user: current_user, event: @event, status: :accepted)
      redirect_to event_checkin_path(@event)
    # Existe el evento y la invitation esta pendiente
    elsif @event && Invitation.find_by(user: current_user, event: @event, status: :pending)
      redirect_to invitations_path
    else
      redirect_to edit_user_path
    end
  end
  helper_method :redirect_decisions

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_event
    @current_event ||= Event.find_by(slug: params[:event])
  end
  helper_method :current_event
end
