class TasksController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction

  def index
    @tasks = current_user.tasks.where(completed: false).order(sort_column + " " + sort_direction)
    @completed_tasks = current_user.tasks.where(completed: true).order(sort_column + " " + sort_direction)
  end

  def new
    @task = Task.new

  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render "new"
    end
  end

  def edit
    @task = Task.find params[:id]
  end

  def show
    @task = Task.find_by_id params[:id]
  end

  def update
    @task = Task.find params[:id]
    @task.update_attributes task_params
    redirect_to tasks_path
  end

  def complete
    @task = Task.find params[:id]
    @task.complete!
    redirect_to tasks_path
  end

  def uncomplete
    @task = Task.find params[:id]
    @task.uncomplete!
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy
    redirect_to tasks_path
  end

  private

  def sort_column
    params[:sort] || "title"
  end
  
  def sort_direction
    params[:direction] || "asc"
  end

  def task_params
      params.require(:task).permit([
          :title, :priority, :description, :date, :completed,
      ])
  end

end
