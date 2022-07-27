class UsersController < ApplicationController
  before_action :set_user, only: [:destroy, :edit, :update]

  def new
    session[:current_time] = Time.now

    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'You have signed up successfully.'
    else
      flash.now[:alert] = 'The input data is invalid.'
      render :new
    end
  end

  def destroy
    @user.destroy
    session.delete(:user_id)

    redirect_to root_path, notice: 'Your account has been deleted.'
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'Your profile has been updated.'
    else
      flash.now[:alert] = 'The input data is invalid.'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password, :password_confirmation
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end