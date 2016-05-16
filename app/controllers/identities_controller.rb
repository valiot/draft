class IdentitiesController < ApplicationController
  def new
    @identity = env['omniauth.identity']
    flash.now[:alert] = @identity&.errors
  end

  def register
    err
    request[:password_confirmation] = request[:password]
  end
end
