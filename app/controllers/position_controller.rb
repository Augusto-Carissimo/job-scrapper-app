class PositionController < ApplicationController
  def index
    @positions = Position.where(created_at: Time.current.all_day).order('created_at ASC').reverse_order
  end

  def scraper
    Scraper.scrape
    positions = Position.where(created_at: Time.current.all_day).order('created_at ASC').reverse_order
    if !positions.empty?
      PositionMailer.update(positions).deliver_now
    end
    redirect_to root_path
  end
end
