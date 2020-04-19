class UsersController < ApplicationController
   before_action :require_user_logged_in, only: [:index, :show, :likes, :edit, :update]
   before_action :correct_user, only: [:edit, :update]
   
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
  
  def edit
    @user = User.find(params[:id])
  end
  
  def likes
    @user = User.find(params[:id])
    @subspots = @user.subspots.order(id: :desc).page(params[:page]).per(15)
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save(context: :user_update)
      flash[:success] = 'ユーザー情報を編集しました !'
      redirect_to controller: 'users', action: 'show', id: current_user
    else
      flash.now[:danger] = 'ユーザー情報の編集に失敗しました !'
      render "users/edit"
    end   
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました !'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました !'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduce, :image, :remove_image)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
