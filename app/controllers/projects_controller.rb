class ProjectsController < ApplicationController
  before_action :action_params, only:[:edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:update]
  def index
    @user = User.all

    if user_signed_in?
      if current_user.role == "Manager"
       @projects = Project.all
       @p = Kaminari.paginate_array(@projects).page(params[:page]).per(2)
      elsif current_user.role == "QA"
        @projects= Project.where("assign_qa like ?", "%#{current_user.id}%")
        #@p = JSON.stringify(@projects)

        @p = Kaminari.paginate_array(@projects).page(params[:page]).per(2)
      else
           @projects= Project.where("assign_developer like ?", "%#{current_user.id}%").page(params[:page])
           @p = Kaminari.paginate_array(@projects).page(params[:page]).per(2)
      end
    end
  end

  def show
  end

  def new
    @project = Project.new
    # @user = User.find(id: params[:id])
  end

  def create


    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path
    else
      flash[:notice] = @project.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update

    if @project.update(project_params)
      redirect_to projects_path
    else
      flash[:notice] = @project.errors.full_messages
      render :edit
    end
  end

  def destroy

    @project.destroy

    redirect_to projects_path, flash: { notice: 'project deleted!' }
  end

  private

  def project_params

    params.require(:project).permit(:title, :project_type, :created_by, :assign_developer => [], :assign_qa =>[])
  end

  def action_params
    @project = Project.find(params[:id])
  end

end
