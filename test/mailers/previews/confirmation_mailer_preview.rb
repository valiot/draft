# Preview all emails at http://localhost:3000/rails/mailers/confirmation_mailer
class ConfirmationMailerPreview < ActionMailer::Preview
  def invitation_accepted
    user = User.first
    event = Event.last
    ConfirmationMailer.invitation_accepted(user, event)
  end
end
