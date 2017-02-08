class ProjectsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :find_project, only: [:show, :edit, :update, :destroy]


  def index
    @projects = Project.all.order('created_at DESC')
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def show
    @posts = @project.posts.all.order('created_at DESC')
  end

  def edit
  end

  def update
    if @project.update(params[:project].permit(:title, :description))
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

end
