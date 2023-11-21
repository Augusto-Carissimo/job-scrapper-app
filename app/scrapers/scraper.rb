# frozen_string_literal: true

require './config/environment'

class Scraper
  def self.scrape
    remote_co
    ruby_on_remote_junior
    ruby_on_remote_mid_level
    working_nomads
  end

  private_class_method :remote_co
  private_class_method :ruby_on_remote_junior
  private_class_method :ruby_on_remote_mid_level
  private_class_method :working_nomads

  def self.remote_co
    remote_co = RemoteCo.new
    remote_co.search
    remote_co.quit
  end

  def self.ruby_on_remote_junior
    ruby_on_remote_junior = RubyOnRemoteJunior.new
    ruby_on_remote_junior.search
    ruby_on_remote_junior.quit
  end

  def self.ruby_on_remote_mid_level
    ruby_on_remote_junior = RubyOnRemoteMidLevel.new
    ruby_on_remote_junior.search
    ruby_on_remote_junior.quit
  end

  def self.working_nomads
    workingnomads = WorkingNomands.new
    workingnomads.search
    workingnomads.quit
  end
end
