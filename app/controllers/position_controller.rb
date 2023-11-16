class PositionController < ApplicationController
  def index
    @positions = Position.where(created_at: Time.current.all_day)
  end

  def scraper
    remote_co = RemoteCo.new
    remote_co.search
    remote_co.quit
    redirect_to root
  end
end
