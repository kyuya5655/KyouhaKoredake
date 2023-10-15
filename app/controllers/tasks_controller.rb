class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def index
    @tasks = Task.page(params[:page])
  end

  def create
    @task = Task.new(tasks_params)
    @task.save
    redirect_to today_path
  end

  def update

  end

  def destroy

  end

  def today

  end

  def complete
    @task = Task.find(task.id)
  end

  private

  def tasks_params
    params.require(:task).permit(:name, :start, :limit, :note, :present, :status)
  end


end
