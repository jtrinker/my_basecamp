class UsersController < ApplicationController
	before_action :get_user, only: [:show, :edit, :update, :destroy]
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "You have signed up successfully"
			redirect_to projects_path
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:notice] = "Profile has been updated."
  			redirect_to "/"
  		else
  			flash[:error] = "Profile failed to update."
  			render "edit"
  		end
	end

	private

	def get_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end	
end
