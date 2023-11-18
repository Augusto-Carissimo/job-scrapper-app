class PositionController < ApplicationController
  def index
    @positions = Position.where(created_at: Time.current.all_day).order('created_at ASC').reverse_order
  end

  def scraper
    remote_co = RemoteCo.new
    remote_co.search
    remote_co.quit
    ruby_on_remote_junior = RubyOnRemoteJunior.new
    ruby_on_remote_junior.search
    ruby_on_remote_junior.quit
    ruby_on_remote_junior = RubyOnRemoteMidLevel.new
    ruby_on_remote_junior.search
    ruby_on_remote_junior.quit
    workingnomads = WorkingNomands.new
    workingnomads.search
    workingnomads.quit
    redirect_to root_path
  end
end
