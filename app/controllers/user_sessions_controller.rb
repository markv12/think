class UserSessionsController < ApplicationController
  before_action :already_logged_in?, only: [:new, :create]
  def new
    @user_session = UserSession.new
  end
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default user_path(current_user)
    else
      render :action => :new
    end
  end

  def destroy
    @user_session = current_user_session
    @user_session.destroy
    redirect_to root_path
  end

  private

  def already_logged_in?
    if current_user
      redirect_to user_path(current_user)
    end
  end
end
