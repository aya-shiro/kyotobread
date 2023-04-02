class User::HomesController < ApplicationController
  def top
    @breads = Bread.all.order(created_at: :desc)
  end
end
