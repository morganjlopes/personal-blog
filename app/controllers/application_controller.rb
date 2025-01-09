class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :_set_domain

  def _set_domain
    unless request.subdomain == 'www'
      @subdomain = request.subdomain
      @website   = Website.find_by(subdomain: @subdomain)
    end
  end

  def _track_action
    ahoy.track "Ran action", request.path_parameters
  end
end
