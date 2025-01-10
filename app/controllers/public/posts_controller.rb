class Public::PostsController < Public::BaseController
  before_action :set_post, only: %i[ show ]

  def index
    @page_title = "Posts"
    @posts      = Post.publicly_searchable
    @posts      = @posts.contains(params[:q])   if params[:q].present?
    @posts      = @posts.with_tag(params[:tag]) if params[:tag].present?
  end

  def feed
    @posts = Post.publicly_searchable.recent
  end

  def show
    @page_title = @post.name
  end

  private
    def set_post
      @post = Post.find(params.expect(:id))
    end
end
