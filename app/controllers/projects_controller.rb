class ProjectsController < ApplicationController

  def index
    @projects = Project.all.order('created_at DESC')
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to @project
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

end
