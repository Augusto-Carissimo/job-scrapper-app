class PositionController < ApplicationController
  def index
    @positions = Position.where(created_at: Time.current.all_day).order('created_at ASC').reverse_order
  end

  def scraper
    # Scraper.scrape
    p '-'*50
    positions = Position.where(created_at: Time.current.all_day).order('created_at ASC').reverse_order
    PositionMailer.update(positions).deliver_now
    redirect_to root_path
  end
end
