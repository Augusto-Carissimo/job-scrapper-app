# frozen_string_literal: true

require './config/environment'

class RailsFactory < Driver
  SEARCH_KEY = 'https://railsfactory.com/careers'

  def search
    @driver.navigate.to SEARCH_KEY

    elements = @driver.find_element(:class, 'career-loop-content').find_elements(:css, 'article.noo_job.hent')
    assign_values(elements)
    Rails.logger.info 'Search finished'
    quit

  rescue StandardError => e
    Rails.logger.warn e.message
  end

  private

  def assign_values(elements)
    elements.each do |element|
      title = element.text
      company = 'FactoryRails'
      link = element.find_element(:css, 'a.btn.btn-primary.apply-btn').attribute('href')
      website = 'FactoryRails'
      Position.create!(title:, company:, link:, website:) if Position.find_by(title:).nil?
    end
  end
end