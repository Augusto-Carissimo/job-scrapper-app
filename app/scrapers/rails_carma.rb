# frozen_string_literal: true

class RailsCarma < Driver
  SEARCH_KEY = 'https://www.railscarma.com/careers/'

  def search
    Rails.logger.info 'Starting Rails Carma search'
    @driver.navigate.to SEARCH_KEY
    elements = @driver.find_elements(:css, 'div.uael-module-content.uael-infobox.uael-imgicon-style-normal.uael-infobox-left.infobox-has-icon.uael-infobox-icon-above-title.uael-infobox-link-type-button')
    elements.each do |e|
      p e.text
    end
    # assign_values

    Rails.logger.info 'Search finished'

  rescue StandardError => e
    Rails.logger.warn e.message
  ensure
    quit
  end

  private

  def assign_values
    title = 'New position'
    company = 'Ombulabs'
    link = 'https://www.ombulabs.com/jobs'
    website = 'REFACTOR SCRAPER TO SAVE CORRECT LINK'
    Position.create!(title:, company:, link:, website:)
  end
end
