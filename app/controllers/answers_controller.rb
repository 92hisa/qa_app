class AnswersController < ApplicationController
  before_action :authenticate_user!

  def new
    @answer = Answer.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      @post.create_notification_answer!(current_user, @answer.id)
      notification = Notification.where(answer_id: @answer.id, visitor_id: current_user.id, post_id: @post.id)
      AnswerMailer.send_answer_notification_mail(notification).deliver
      flash[:notice] = "回答しました"
      redirect_to post_path(id: @post.id)
    else
      flash[:alert] = "回答できませんでした"
      render 'new'
    end
  end

  def edit
    @answer = Answer.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def update
    @answer = Answer.find(params[:id])
    @post = Post.find(params[:post_id])
    if @answer.update(answer_params)
      flash[:notice] = "編集が完了しました"
      redirect_to post_list_user_path(id: current_user.id)
    else
      flash[:alert] = "編集できませんでした"
      render :edit
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
