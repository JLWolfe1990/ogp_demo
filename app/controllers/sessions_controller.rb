class SessionsController < ApplicationController
  skip_before_action :redirect_authenticated

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_attrs)

    if @user
      session[:user_id] = @user.id

      flash[:success] = "Welcome to the OGP demo #{@user.first_name}"
      redirect_to root_path # root path because I don't want the url to be '/welcome'
    else
      render(:new)
    end
  end

  def destroy
    flash[:danger] = "Sorry to see you go #{current_user.first_name}!"
    session[:user_id] = nil

    redirect_to login_path
  end

  private

  def user_attrs
    params.require(:user).permit(:full_name)
  end
end