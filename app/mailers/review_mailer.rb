class ReviewMailer < ApplicationMailer
  def review_invite(user, event)
    @user = user
    @event = event
    mail(to: @user.email, subject: "💯 Evalúa tu experiencia en #{@event.name}")
  end
end
