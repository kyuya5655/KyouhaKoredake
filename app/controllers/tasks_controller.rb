class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def index

  end

  def create

  end

  def update

  end

  def destroy

  end

  def today

  end

  private

  def tasks_params
    params.require(:task).permit(:name, :start, :limit, :note, :note_image, :present, :status)
  end


end
