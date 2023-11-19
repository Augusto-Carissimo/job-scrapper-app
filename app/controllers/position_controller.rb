class PositionController < ApplicationController
  def index
    @positions = Position.where(created_at: Time.current.all_day).order('created_at ASC').reverse_order
  end

  def scraper
    Scraper.scrape
    redirect_to root_path
  end
end
