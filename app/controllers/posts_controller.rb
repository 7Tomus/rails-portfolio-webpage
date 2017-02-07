class PostsController < ApplicationController

  def show
    # @project = Project.find(params[:project_id])
    @post = Post.find(params[:id])
  end

  def new
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    @post = @project.posts.create(params[:post].permit(:title, :description, :image))
    redirect_to project_path(@project)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(params[:project].permit(:title, :description))
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @post = @project.posts.find(params[:id])
    @post.destroy

    redirect_to project_path(@project)
  end

end
