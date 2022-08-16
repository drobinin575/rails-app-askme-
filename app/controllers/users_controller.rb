class UsersController < ApplicationController
  before_action :set_user, only: [:destroy, :edit, :show, :update]
  before_action :authorize_user, only: [:edit, :update, :destroy]


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

  def show
    @questions = @user.questions.order(created_at: :desc)
    @question = Question.new(user: @user)
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: 'Your profile has been updated.'
    else
      flash.now[:alert] = 'The input data is invalid.'
      render :edit
    end
  end

  private

  def authorize_user
    redirect_with_alert unless @user == current_user
  end

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password, :password_confirmation, :navbar_color
    )
  end

  def set_user
    @user = User.find_by(nickname: params[:nickname])
  end
end
