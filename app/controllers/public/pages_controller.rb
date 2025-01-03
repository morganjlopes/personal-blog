class Public::PagesController < ApplicationController
  def home
    @posts = Post.publicly_searchable
  end
end
