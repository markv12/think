class UsersController < ApplicationController
  before_filter :login_required, :only => :show

  def index
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Registration Successful"
      redirect_to root_path
    else
      render :action => :new
    end
  end

  def graph
    @daily_assessment = current_user.daily_assessment
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end


  private
  def login_required
    unless current_user
      flash[:error] = 'You must be logged in to view this page.'
      redirect_to new_user_session_path
    end
  end
end