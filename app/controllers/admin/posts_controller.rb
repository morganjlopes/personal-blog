class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.order(published_at: :desc)
    @posts = @posts.send(params[:scope]) if params[:scope].present?
    @posts = @posts.contains(params[:q]) if params[:q].present?
  end

  def show
  end

  def new
    @dup  = Post.find(params[:dup]) if params[:dup].present?
    @post = Post.new(
      name:         @dup.present? ? "#{@dup.name} Copy" : "Untitled Post",
      content:      @dup.present? ? @dup.content : "",
      slug:         @dup.present? ? (@dup.slug + "-copy") : "",
      page_type:    @dup.present? ? @dup.page_type : "post",
      website_ids:  @dup.present? ? @dup.website_ids : Setting.default_website_id,
      published_at: Post.next_unscheduled_date,
    )
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save!
        format.html { redirect_to edit_admin_post_path(@post), notice: "Post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to edit_admin_post_path(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to admin_posts_path, status: :see_other, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params.expect(:id))
    end

    def post_params
      params.expect(post: [
        :name,
        :content,
        :page_type,
        :published_at,
        :is_pinned,
        :visibility, 
        :slug,
        website_ids: []
      ])
    end
end
