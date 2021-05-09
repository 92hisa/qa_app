module NotificationsHelper
  def notification_form(notification)
  if notification.post_id == nil
    @answer_id = Comment.where(id: notification.comment_id).pluck(:answer_id)
    @post_id = Answer.find(@answer_id).pluck(:post_id)
    if notification.answer_id != notification.visitor_id
      your_answer = link_to 'あなたの回答', post_path(id: @post_id),data: {"turbolinks" => false}, style: "color: #696969; font-weight: bold;"
    else
      your_answer = link_to 'あなたがコメントした回答', post_path(id: @post_id),data: {"turbolinks" => false}, style: "color: #696969; font-weight: bold;"
    end
  end
  visitor = link_to notification.visitor.name, notification.visitor,data: {"turbolinks" => false}, style: "color: #696969; font-weight: bold;"
  your_post = link_to 'あなたの質問', notification.post, style: "color: #696969; font-weight: bold;",data: { "turbolinks" => false }


  case notification.action
  when "answer"
      "#{visitor}が#{your_post}に回答しました"
  when "like"
      "#{visitor}が#{your_post}にいいね！しました"
  when "comment"
      "#{visitor}が#{your_answer}にコメントしました"
  end
  end

  def unchecked_notifications
    current_user.passive_notifications.where(checked: false)
  end
end
