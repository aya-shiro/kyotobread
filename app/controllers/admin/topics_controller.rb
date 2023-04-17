class Admin::TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = "特集の登録が完了しました"
      redirect_to admin_topic_path(@topic.id)
    else
      render :new
    end
  end

  def index
    @topics = Topic.all.order(created_at: :desc)
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
      flash[:notice] = "特集を更新しました"
      redirect_to admin_topic_path(@topic.id)
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.delete
      flash[:notice] = "特集を削除しました"
      redirect_to admin_topics_path
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :body, :is_published)
  end
end
