class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings.all
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers.all
  end

end
