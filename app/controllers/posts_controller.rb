class PostsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @post = @project.posts.create(params[:post].permit(:title, :description, :image))
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @post = @project.posts.find(params[:id])
    @post.destroy

    redirect_to project_path(@project)
  end

end
