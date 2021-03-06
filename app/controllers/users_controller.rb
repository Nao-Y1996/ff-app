class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]
	before_action :is_admin?, only: [:change_is_admin]
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])

  end

  def edit
  	@user = User.find(params[:id])
  end

  def change_is_admin
  	user = User.find(params[:user_id])
  	if user.is_admin == true
  		user.is_admin = false
  		user.save
  		redirect_to user_path(user)
  	else
  		user.is_admin = true
  		user.save
  		redirect_to user_path(user)
  	end
  end



  def update
  end

  private#----------------------
    def correct_user
	    user = User.find(params[:id])
	    if current_user != user
	      redirect_to user_path(current_user)
	    end
	end


end
