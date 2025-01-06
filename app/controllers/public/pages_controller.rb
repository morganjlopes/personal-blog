class Public::PagesController < ApplicationController
  def home
    @website = Website.all.first

    redirect_to root_url(subdomain: @website.subdomain), allow_other_host: true if @website.present?
  end
end
