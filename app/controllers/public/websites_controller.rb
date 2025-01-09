class Public::WebsitesController < Public::BaseController

  def show
    @posts = @website.posts.publicly_searchable

    @page_title = "#{@website.name}"
  end
end
