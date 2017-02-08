class CommentsController < ApplicationController
  before_action :find_post_and_project, only: [:edit, :create, :destroy]
  def edit
    @project = Project.find(params[:project_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:name, :content))

    redirect_to project_post_path(@project, @post)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @post = Post.find(params[:post_id])
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
