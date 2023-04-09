class Admin::TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = "特集登録完了しました"
      redirect_to admin_topics_path
    end
  end

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to admin_topics_path
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.delete
      redirect_to admin_topics_path
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :body)
  end
end
