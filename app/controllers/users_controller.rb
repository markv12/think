class UsersController < ApplicationController
  helper UsersHelper 
  before_action :login_required, only: [:show, :graph, :timeline, :entry_history]

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
    @word_info = current_user.word_info
  end

  def timeline
    @entries = Entry.where('user_id=?', current_user.id).sort_by(&:updated_at)
    first_date = @entries.first.updated_at
    last_date = @entries.last.updated_at


    @earliest_time = first_date.to_i
    @time_range = last_date.to_i - @earliest_time
    if(@time_range == 0)
      @time_range = 1;
    end
    @total_entry_height = @entries.count * 20;

    @month_ticks = all_months_between(first_date, last_date)
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

  def entry_history
    @entries = current_user.entries.order('entries.created_at DESC')
  end

  private
  def login_required
    unless current_user
      flash[:error] = 'You must be logged in to view this page.'
      redirect_to new_user_session_path
    end
  end

  def all_months_between(to, from)
    from, to = to, from if from > to
    m = Date.new from.year, from.month
    result = []
    while m <= to
      result << m.to_time
      m >>= 1
    end

    result
  end
end