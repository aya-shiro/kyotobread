class User::FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user

    if @feedback.save!
      redirect_to feedbacks_thanks_path
    else
      render :new
    end
  end


  private
  def feedback_params
    params.require(:feedback).permit(:opinion, :is_solved)
  end

end
