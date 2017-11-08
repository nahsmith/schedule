class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def user_params
    params.require(:user).permit(:user_id,:user_first_name,:user_last_name, :email, :password, :password_confirmation,:user_administrator,:user_priority,:user_phone_number)
  end

  def index
    @users = User.all
  end

  def show
    set_user
  end

  def new
    # default: render 'new' template
  end

  def edit
    set_user
  end

  def create
    if User.find_by_user_id(params[:user][:user_id])
      flash[:warning]= "Sorry, this user-id is already taken. Please Try again."
      redirect_to new_user_path
    else   
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = "Sign up successful! Welcome to Scheduler"
        redirect_to login_path
      else
        render 'new'
      end 
    end  
  end

  def update
    @user = User.find params[:user_id]
    @user.update_attributes!(user_params)
    flash[:notice] = "#{@user.user_id}'s account was successfully updated."
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @user.destroy
    flash[:notice] = "#{@user.user_id}'s account was successfully deleted."
    redirect_to users_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

end