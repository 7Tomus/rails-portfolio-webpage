class PostsController < ApplicationController
  before_action :find_post_and_project, only: [:show, :edit, :update]

  def show
    @comments = @post.comments.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @project = Project.find(params[:project_id])
    @post = @project.posts.create(params[:post].permit(:title, :description, :image))
    if @post.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(params[:post].permit(:title, :description, :image))
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

  private

  def find_post_and_project
    @project = Project.find(params[:project_id])
    @post = Post.find(params[:id])
  end

end
