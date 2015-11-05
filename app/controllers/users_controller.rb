class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in @user # log_in method defined in session_helper.rb
      redirect_to @user
    else
      flash.now[:error] = @user.errors.full_messages.join('. ')
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
