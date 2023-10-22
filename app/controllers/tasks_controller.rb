class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def index
    @tasks = current_user.tasks.all.order(limit: :ASC).page(params[:page]).per(5)
    if params[:keyword]
      @tasks = @tasks.search(params[:keyword]).page(params[:page])
    else
      @tasks = @tasks.page(params[:page])
    end
  end

  def create
    @task = Task.new(tasks_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to edit_task_path(@task.id)
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(tasks_params)
      if @task.status == "completed"
        @task_today_counts = Task.where(limit: Date.today).where(status: [0, 1]).count
        render :complete
      else
        redirect_to edit_task_path
      end
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to today_path
  end

  def today
    @today = Date.today
    @task = current_user.tasks.where(limit: Date.today).where(status: [0, 1])
    @task_today_counts = @task.where(limit: Date.today).where(status: [0, 1]).count
    @limit_over_tasks = current_user.limit_over_tasks
  end

  def complete
    @task = current_user.tasks.find(task.id)
    @task_today_counts = current_user.tasks.where(limit: Date.today).where(status: [0, 1])
  end

  private

  def tasks_params
    params.require(:task).permit(:name, :start, :limit, :note, :present, :status, :image)
  end


end
