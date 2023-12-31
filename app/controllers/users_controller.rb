class UsersController < ApplicationController


  def show
    @task_today_counts = current_user.tasks.where(limit: Date.today, status: [0,1]).count
    if Rails.env.production?
      @task_achievement = current_user.tasks.where("DATE_FORMAT(start,'%Y') = ? AND DATE_FORMAT(start,'%m') = ?", Time.now.year.to_s, Time.now.month.to_s)
    else
      @task_achievement = current_user.tasks.where("strftime('%Y', start) = ? AND strftime('%m', start) = ?", Time.now.year.to_s, Time.now.month.to_s)
    end
      
    @task_achievement_ratio_original = @task_achievement.group("tasks.status").count("tasks.id").sort_by { |_, v| v }.reverse.to_h

    @task_achievement_ratio = {}
    @task_achievement_ratio_original.each do |k,v|
      achievement = (v.to_f / @task_achievement.count) * 100
      @task_achievement_ratio[Task.statuses_i18n[k]] = achievement.round
    end
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
