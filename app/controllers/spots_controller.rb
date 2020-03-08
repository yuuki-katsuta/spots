class SpotsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit]
  
  def new
    @spot = current_user.spots.new
  end
  
  def show
    @spot = Spot.find(params[:id])
  end
  
  def destroy
    @spot.destroy
    flash[:success] = 'スポットを削除しました。'
    redirect_to controller: 'users', action: 'show', id: current_user
  end
  
  def create
    @spot = current_user.spots.build(spot_params)

    if @spot.save
      flash[:success] = 'スポットを投稿しました。'
      redirect_to controller: 'users', action: 'show', id: current_user
    else
      flash.now[:danger] = 'スポットの投稿に失敗しました。'
      render :new
    end
  end
  
  def edit
    @spot = Spot.find(params[:id])
  end
  
  def update
    spot = Spot.find(params[:id])
    spot.update(spot_params)
    
    if spot.save
      flash[:success] = 'スポットを更新しました。'
      redirect_to spot
    else
      flash[:danger] = 'スポットの更新に失敗しました。'
      redirect_to edit_spot_path
    end
  end

  private
  
  def spot_params
    params.require(:spot).permit(:name, :address, :about, :picture, :remove_picture)
  end
  
  def correct_user
    @spot = current_user.spots.find_by(id: params[:id])
    unless @spot
      redirect_to root_url
    end
  end
end
