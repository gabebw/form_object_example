class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_email(params[:session][:email])

    if user
      set_current_user(user)
      redirect_to root_path
    else
      flash[:error] = "That user does not exist"

      render :new
    end
  end

  def destroy
    cookies[:id] = nil
    redirect_to root_path
  end
end
