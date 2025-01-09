class Public::BaseController < ApplicationController
  after_action :_track_action
end
