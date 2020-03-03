class UsersController < ApplicationController
   before_action :require_user_logged_in, only: [:index, :show, :likes]
   
  def index
    @users = User.order(id: :desc).page(params[:page]).per(15)
  end

  def show
    @user = User.find(params[:id])
    @spots = @user.spots.order(id: :desc).page(params[:page]).per(15)
  end

  def new
    @user = User.new
  end
  
  def likes
    @user = User.find(params[:id])
    @subspots = @user.subspots.joins(:favorites).references(:favorites).group('favorites.spot_id').order('max(favorites.id) DESC').page(params[:page]).per(15)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
