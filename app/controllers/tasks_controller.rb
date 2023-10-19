class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def index
    @tasks = Task.all.order(limit: :ASC).page(params[:page]).per(5)
  end

  def create
    @task = Task.new(tasks_params)
    @task.user_id = current_user.id
    @task.save
    redirect_to today_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update!(tasks_params)
    if @task.status == "completed"
      @task_today_counts = Task.where(limit: Date.today).where(status: [0, 1]).count
      render :complete
    else
      redirect_to edit_task_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to today_path
  end

  def today
    @today = Date.today
    @task = Task.where(limit: Date.today).where(status: [0, 1])
    @task_today_counts = Task.where(limit: Date.today).where(status: [0, 1]).count
    @user = current_user
    @limit_over_tasks = @user.limit_over_tasks
  end

  def complete
    @task = Task.find(task.id)
    @task_today_counts = Task.where(limit: Date.today).where(status: [0, 1])
  end

  private

  def tasks_params
    params.require(:task).permit(:name, :start, :limit, :note, :present, :status, :image)
  end


end
