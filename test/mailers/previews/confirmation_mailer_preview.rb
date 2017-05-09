# Preview all emails at http://localhost:3000/rails/mailers/confirmation_mailer
class ConfirmationMailerPreview < ActionMailer::Preview
  def invitation_accepted
    invitation = Invitation.last
    ConfirmationMailer.invitation_accepted(invitation)
  end
end
