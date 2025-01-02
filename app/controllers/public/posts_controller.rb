class Public::PostsController < ApplicationController
  before_action :set_post, only: %i[ show ]

  def index
    @posts = Post.publicly_searchable
  end

  def show
  end

  private
    def set_post
      @post = Post.find(params.expect(:id))
    end
end
