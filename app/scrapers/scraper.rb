# frozen_string_literal: true

require './config/environment'

class Scraper
  def self.scrape
    Dir.entries('./app/scrapers')
      .map { |file| File.basename(file, File.extname(file)).classify }
      .filter_map { |class_name| class_name.constantize.new.search unless class_name == 'Scraper' || class_name == 'Driver' || class_name.blank? }
  end
end
