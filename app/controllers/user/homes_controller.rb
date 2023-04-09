class User::HomesController < ApplicationController
  def top
    @breads = Bread.all.order(created_at: :desc)
    @topics = Topic.all.order(created_at: :desc)
  end
end
