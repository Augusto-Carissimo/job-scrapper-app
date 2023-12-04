# frozen_string_literal: true

class Ombulabs < Driver
  SEARCH_KEY = 'https://www.ombulabs.com/jobs'

  def search
    Rails.logger.info 'Starting Ombulabs search'
    @driver.navigate.to SEARCH_KEY
    element = @driver.find_element(:class, 'open-position-list').text
    assign_values if element != "We don't have any open positions at the moment. Check back soon or keep an eye on Twitter and LinkedIn, we post new job openings there as they become available."

    Rails.logger.info 'Search finished'
    quit

  rescue StandardError => e
    Rails.logger.warn e.message
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
