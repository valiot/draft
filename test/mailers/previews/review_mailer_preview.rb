# Preview all emails at http://localhost:3000/rails/mailers/confirmation_mailer
class ReviewMailerPreview < ActionMailer::Preview
  def review_invite
    user = User.first
    event = Event.last
    ReviewMailer.review_invite(user, event)
  end
end
