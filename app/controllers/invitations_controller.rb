class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:accept, :reject]

  def accept
    if @invitation.update(status: :accepted)
      flash[:notice] = 'Aceptaste la invitación'
      redirect_decisions
    else
      render invitations_path
    end
  end

  def reject
    if @invitation.update(status: :rejected)
      flash[:alert] = 'Rechazaste la invitación.'
      redirect_to edit_user_path
    else
      render invitations_path
    end
  end

  private

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end
end
