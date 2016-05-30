class Event::IdentitiesController < Event::ApplicationController
  def new
    @identity = env['omniauth.identity']
    flash.now[:alert] = @identity&.errors
  end
end
