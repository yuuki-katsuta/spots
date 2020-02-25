class SpotsController < ApplicationController

  def index
    @spots = Spot.all
  end

  def new
    @spot = current_user.spots.new
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

  private

    # 投稿フォームからデータ抽出
  def spot_params
    params.require(:spot).permit(:name, :address, :about)
  end
  
  
end
