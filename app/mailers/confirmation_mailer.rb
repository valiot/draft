class ConfirmationMailer < ApplicationMailer
  def invitation_accepted(invitation)
    @user = invitation.user
    @event = invitation.event
    mail(to: @user.email, subject: "🚀 #{@event.name.titleize} invitación confirmada")
  end
end
