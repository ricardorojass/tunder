class FriendsController < ApplicationController
	before_action :authenticate_user!

  def index
  	pick_next_friend
  end

  def like
  	friend_value = params[:id]
  	liked_value  = params[:liked].present?

  	current_user.likes.create(friend_id: friend_value, liked: liked_value)
  	pick_next_friend
  	render :index
  end

  def pick_next_friend
  	@friend = User.where.not(id: current_user.id).order("RANDOM()").first
  end

end
