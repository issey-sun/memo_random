class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end

  def new
    @memo = Memo.new
  end

  def create
    if @memo = Memo.new(memo_params)
    @memo.save
    redirect_to root_path
    end
 end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    memo = Memo.find(params[:id])
    memo.update(memo_params)
    redirect_to root_path
  end

  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
    redirect_to root_path
  end
 
 private
  def memo_params
    params.require(:memo).permit(:title, :introduce, :day, :image, :user)
  end

end
