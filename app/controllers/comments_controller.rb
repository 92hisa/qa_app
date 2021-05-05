class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @answer = Answer.find(params[:answer_id])
    @comment = Comment.new(comment_params)
    if @comment.save
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
