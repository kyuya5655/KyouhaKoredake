class UsersController < ApplicationController

  def show
    @task_today_counts = Task.where(limit: Date.today).count
  end

  def edit
    current_user
  end

  def update
    current_user.update(user_params)
    redirect_to user_path
  end

  def quit_check

  end

  def withdraw
    current_user.update(is_deleted: true)
    reset_session
    redirect_to new_user_registration_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
