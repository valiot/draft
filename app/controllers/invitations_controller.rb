class InvitationsController < ApplicationController
  def accept
    respond_to do |format|
      if @invitations.update(status: :accepted)
        flash.now[:notice] = 'Aceptaste la invitación'
        format.js
      else
        format.html { render invitations_path }
        format.json { render json: @invitations.errors, status: :unprocessable_entity }
      end
    end
  end

  def reject
    respond_to do |format|
      if @invitations.update(status: :rejected)
        flash.now[:alert] = 'Rechazaste la invitación.'
        format.js
      else
        format.html { render invitations_path }
        format.json { render json: @invitations.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @invitations
    if @invitations.update(invitations_params)
      redirect_to [:user, @invitations], notice: 'Se actualizó tu perfil.'
    else
      render invitationss_path
    end
  end

  private

  def set_invitations
   @invitations = Invitation.find(params[:id])
 end

  def invitations_params
    params.require(:invitations).permit(:link, :status, :event_id)
  end
end
