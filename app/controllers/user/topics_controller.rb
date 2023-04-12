class User::TopicsController < ApplicationController
  def index
    @topics = Topic.all.order(created_at: :desc)
  end

  def show
    @topic = Topic.find(params[:id])
  end
end
