class Public::PostsController < ApplicationController
  before_action :set_post, only: %i[ show ]

  def index
    @posts = Post.publicly_searchable
    @posts = @posts.contains(params[:q]) if params[:q].present?

    @page_title = "Posts"
  end

  def show
    @page_title = @post.name
  end

  private
    def set_post
      @post = Post.find(params.expect(:id))
    end
end
