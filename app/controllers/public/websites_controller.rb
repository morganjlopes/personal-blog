class Public::WebsitesController < ApplicationController

  def show
    @posts = @website.posts.publicly_searchable
  end
end
