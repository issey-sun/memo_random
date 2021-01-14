class MemosController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def memo_params
    params.require(:memo).permit(:title, :introduce, :day, :image, :user).merge(user_id: current_user.id)
  end

end
