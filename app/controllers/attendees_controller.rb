class InvitationsController < ApplicationController
  def present
    respond_to do |format|
      if @user.update(status: :accepted)
        flash.now[:notice] = 'Gracias por avisarnos que ya estas aquí'
        format.js
      else
        format.html { render invitations_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
