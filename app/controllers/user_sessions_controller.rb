class UserSessionsController < ApplicationController
  before_action :already_logged_in?, only: [:new, :create]
  def new
    @user_session = UserSession.new
  end
  def create
    the_params = params.require(:user_session).permit(:email, :password)
    @user_session = UserSession.new(the_params.to_h)
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default me_path
    else
      render action: :new
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
      redirect_to me_path
    end
  end
end
