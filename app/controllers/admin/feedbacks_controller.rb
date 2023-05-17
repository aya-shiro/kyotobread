class Admin::FeedbacksController < ApplicationController

  def index
    # 未解決ご意見は受け取った順に並べる
    @feedbacks = Feedback.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @feedback = Feedback.find(params[:id])
    @user = @feedback.user
  end

  def update
    @feedback = Feedback.find(params[:id])
    if @feedback.update(feedback_params)
      redirect_to admin_feedbacks_solved_path(@solved_feedback)
    end
  end

  def solved
    # 解決済みご意見は解決した順に並べる
    @feedbacks = Feedback.all.order(updated_at: :desc).page(params[:page]).per(20)
  end

  def destroy
    feedback = Feedback.find(params[:id])
    if feedback.destroy
      redirect_to admin_feedbacks_solved_path
    end
  end

  private
  def feedback_params
    params.require(:feedback).permit(:is_solved, :opinion)
  end

end
