class SignUpController < ApplicationController

  def create
    @sign_up = SignUp.new(sign_up_params)
    if @sign_up.save
      redirect_to root_path
    else
      redirect_to root_path
      flash[:error] = @sign_up.errors.full_messages.to_sentence
    end
  end

  private

  def sign_up_params
    params.require(:sign_up).permit(:email)
  end

end
