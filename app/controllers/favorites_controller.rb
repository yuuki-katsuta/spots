class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    spot = Spot.find(params[:spot_id])
    current_user.favorite(spot)
    flash[:success] = '投稿をお気に入りしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    spot = Spot.find(params[:spot_id])
    current_user.unfavorite(spot)
    flash[:success] = '投稿のお気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
