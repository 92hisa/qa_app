class AnswersController < ApplicationController

  def new
    @ansewr = Answer.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @answer = Answer.new(answer_params)
    if @answer.save!
      flash[:notice] = "コメントしました"
      redirect_to post_path(id: @post.id)
    else
      flash[:alert] = "コメントできませんでした"
      redirect_to post_path(id: @post.id)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:episode, :content).merge(user_id: current_user.id, post_id: @post.id)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
