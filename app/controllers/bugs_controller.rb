class BugsController < ApplicationController
  def index

    @projects = Project.find(params[:project_id])
    @bugs = @projects.bugs
    @bug_paginate = Kaminari.paginate_array(@bugs).page(params[:page]).per(3)

    #@bug = Bug.page(params[:page])

    #@projects = Project.find(params[:project_id]).page(params[:page])
  end

  def show

  end

  def new
    @bug = Bug.new
    @project = Project.all
  end

  def assign_ticket
    @bug = Bug.find(params[:id])
    if (current_user.role == 'Developer' && !@bug.assign_developer.present?) || (current_user.role == 'Developer' && @bug.status == 'Active')


      @bug.update(assign_developer: current_user.id, status: 'Taken')


      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end


  def create

    @bug = Bug.new(bug_params)

    if @bug.save

      redirect_to project_bugs_path
    else
      flash[:notice] = @bug.errors.full_messages
      render :new
    end
  end

  def edit
    @bug = Bug.find(params[:id])
  end

  def update
    @bug = Bug.find(params[:id])
    if @bug.update(bug_params)
      redirect_to project_bugs_path
    else
      render :edit
    end
  end

  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy
    redirect_to project_bugs_path
  end

  private

  def bug_params
    params.require(:bug).permit(:description, :deadline, :bug_type, :status, :project_id, :assign_developer, :avatar)
  end
end
