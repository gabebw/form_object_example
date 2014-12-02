class UsersController < ApplicationController
  def new
    @user = User.new
    @user.build_company
  end

  def create
    @user = User.new(user_params)

    if @user.save
      set_current_user(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, company_attributes: [:name])
  end
end
