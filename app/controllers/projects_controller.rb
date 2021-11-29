class ProjectsController < ApplicationController
  before_action :action_params, only:[:edit, :update, :destroy]
  def index
    if current_user.role == "Manager"
     @projects = Project.all
    elsif current_user.role == "QA"
      @projects = Project.where(assign_qa: current_user.id)
    else
      @projects = Project.where(assign_developer: current_user.id)
    end
    @user = User.all
  end

  def show

  end

  def new
    @project = Project.new
  end

  def create


    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, flash: { notice: 'project deleted!' }
  end

  private

  def project_params

    params.require(:project).permit(:title, :project_type, :created_by, :assign_developer, :assign_qa)
  end

  def action_params
    @project = Project.find(params[:id])
  end

end
