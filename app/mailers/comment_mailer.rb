class CommentMailer < ApplicationMailer
  def send_comment_notification_mail(notification)
    @user_ids = Notification.where(id: notification.ids).pluck(:visited_id)
    @user = User.where(id: @user_ids)
    binding.pry
    @user.each do |user|
      mail to: user.email, subject: '【Keiken】 コメントがありました'
    end
  end
end
