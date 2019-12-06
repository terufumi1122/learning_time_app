class UsersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user[:id]
      redirect_to root_path, notice: 'Your account is perfectly registred!!'
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    redirect_to user_path(@current_user), notice: "Updated!"
  end

  def destroy
    user = User.find(@current_user.id)
    user.destroy
    redirect_to root_url, notice: "Completely delete!!"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :line_notify_token)
  end

end
