class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
    flash[:notice] = "following user"
    else
      flash[:error] = "There was somthing wrong with the tracking request"
    end
    redirect_to my_friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
      #  ".first" for get the object form DB
    friendship.destroy
    flash[:notice] = "stopped following"
    redirect_to my_friends_path
  end
end
