class UsersController < ApplicationController
  # todo: rename sessionscontroller
  skip_before_action :redirect_authenticated

  def new
    @user = User.new
  end

  def create
    @user = User.create(full_name: params[:user][:full_name])

    if @user
      session[:user_id] = @user.id

      flash[:success] = "Welcome to the OGP demo #{@user.first_name}"
      redirect_to welcome_path
    else
      render(:new)
    end
  end

  def destroy
    flash[:danger] = "Sorry to see you go #{current_user.first_name}!"
    current_user.destroy!
    session[:user_id] = nil

    redirect_to new_user_path
  end
end