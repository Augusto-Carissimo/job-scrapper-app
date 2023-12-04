# frozen_string_literal: true

require './config/environment'

class Scraper
  def self.scrape
    [RemoteCo, RubyOnRemoteJunior, RubyOnRemoteMidLevel, WorkingNomands, Ombulabs, RailsFactory].map { |scraper| scraper.new.search }
  end
end
