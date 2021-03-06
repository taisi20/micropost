class MicropostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def new
    @micropost = Micropost.new
    @user = User.find(current_user.id)
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "メッセージを投稿しました。"
      redirect_to root_url
    else
      @microposts = current_user.microposts.order(id: :desc).page(params[:page])
      @user = User.find(current_user.id)
      flash.now[:danger] = "メッセージの投稿に失敗しました。"
      render "toppages/index"
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "メッセージを削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  def edit
    @micropost = Micropost.find(params[:id])
  end
  
  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update(micropost_params)
      flash[:success] = "投稿は正常に更新されました"
      redirect_to root_url
    else
      flash.now[:danger] = "投稿は正常に更新されませんでした"
      render :edit
    end
  end
  
  private
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
  end
  
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
