class CommentsController < ApplicationController
  before_action :find_post_and_project, only: [:edit, :create, :destroy]
  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @post.comments.create(params[:comment].permit(:name, :content))
    redirect_to project_post_path(@project, @post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to project_post_path(@project, @post)
  end

  private

  def find_post_and_project
    @project = Project.find(params[:project_id])
    @post = Post.find(params[:post_id])
  end
end
