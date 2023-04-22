class Admin::FeedbacksController < ApplicationController
  def index
    @feedbacks = Feedback.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @feedback = Feedback.find(params[:id])
    @user = @feedback.user
  end

  def destroy
    feedback = Feedback.find(params[:id])
    user_id = feedback.user.id

    if feedback.destroy
      redirect_to admin_feedbacks_path(user_id)
    end

  end
end
