class AnswerMailer < ApplicationMailer
  def send_answer_notification_mail(notification)
    @user_ids = Notification.where(id: notification.ids).pluck(:visited_id)
    @user = User.where(id: @user_ids)
    @user.each do |user|
      mail to: user.email, subject: '【Keiken】 回答がありました'
    end
  end
end
