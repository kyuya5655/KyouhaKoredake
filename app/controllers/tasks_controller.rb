class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def index
    @tasks = Task.page(params[:page])
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
    @task.update(tasks_params)
    redirect_to edit_task_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to today_path
  end

  def today
    @task = Task.where(start: 'today' )
  end

  def complete
    @task = Task.find(task)
  end

  private

  def tasks_params
    params.require(:task).permit(:name, :start, :limit, :note, :present, :status, :image)
  end


end
