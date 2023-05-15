class Admin::FeedbacksController < ApplicationController
  def index
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
    @feedbacks = Feedback.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def solved_index
    @feedbacks = Feedback.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def destroy
    feedback = Feedback.find(params[:id])
    user_id = feedback.user.id

    if feedback.destroy
      redirect_to admin_feedbacks_path(user_id)
    end
  end

  private
  def feedback_params
    params.require(:feedback).permit(:is_solved, :opinion)
  end

end
