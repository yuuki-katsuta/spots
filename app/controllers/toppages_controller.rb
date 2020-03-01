class ToppagesController < ApplicationController
  def index
    @user = User.new
    if logged_in? 
      redirect_back(fallback_location: user_path(current_user)) 
    end
  end
end
