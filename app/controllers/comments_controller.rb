class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @answer = Answer.find(params[:answer_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      @answer.create_notification_comment!(current_user, @comment.id)
      notification = Notification.where(comment_id: @comment.id, visitor_id: current_user.id, answer_id: @answer.id)
      CommentMailer.send_comment_notification_mail(notification).deliver
      flash[:notice] = "コメントしました"
      redirect_to root_path
    else
      flash[:alert] = "コメントできませんでした"
      redirect_to post_path(@post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, answer_id: @answer.id)
  end

  def find_answer
    @answer = Answer.find(params[:answer_id])
  end
end
