class ToppagesController < ApplicationController
  def index
    if logged_in?
      @micropost = current_user.microposts.build
      @microposts = current_user.feed_microposts.order(id: :desc).page(params[:page])
      @user = User.find(current_user.id)
      @followings = @user.followings.page(params[:page])
      @followers = @user.followers.page(params[:page])
      counts(@user)
    end
  end
end
