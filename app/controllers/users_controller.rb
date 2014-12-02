class UsersController < ApplicationController
  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)

    if @signup.save
      set_current_user(@signup.user)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def signup_params
    params.require(:signup).permit(:user_email, :company_name)
  end
end
