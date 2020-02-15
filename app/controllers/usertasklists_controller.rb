class UsertasklistsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    if logged_in?
      @usertasklist = current_user.usertasklists.build(usertasklist_params)
      if @usertasklist.save!
        flash[:success] = 'メッセージを投稿しました。'
        redirect_to root_url
      else
        @usertasklists = current_user.usertasklists.order(id: :desc).page(params[:page])
        flash.now[:danger] = 'メッセージの投稿に失敗しました。'
        render 'tasks/index'
      end
    end
  end

  def destroy
    if logged_in
      @usertasklist.destroy
      flash[:success] = 'メッセージを削除しました。'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def usertasklist_params
    params.require(:usertasklist).permit(:content,:title)
  end
  
  def correct_user
    @usertasklist = current_user.usertasklists.find_by(id: params[:id])
    unless @usertasklist
      redirect_to root_url
    end
  end
end