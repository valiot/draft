class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:accept, :reject]

  def accept
    respond_to do |format|
      if @invitation.update(status: :accepted)
        flash.now[:notice] = 'Aceptaste la invitación'
        format.js
      else
        format.html { render invitations_path }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  def reject
    respond_to do |format|
      if @invitation.update(status: :rejected)
        flash.now[:alert] = 'Rechazaste la invitación.'
        format.js
      else
        format.html { render invitations_path }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end
end
