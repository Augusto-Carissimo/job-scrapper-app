# frozen_string_literal: true

class WorkingNomands < Driver
  SEARCH_KEY = 'https://www.workingnomads.com/jobs?tag=ruby'

  def search
    Rails.logger.info 'Starting Working Nomads search'

    @driver.navigate.to SEARCH_KEY
    elements = @driver.find_element(:class, 'jobs-list').find_elements(:class, 'ng-scope')
    assign_values(elements)
  rescue StandardError => e
    Rails.logger.warn e.message

  Rails.logger.info 'Search finished'
rescue StandardError => e
  Rails.logger.warn e.message
  end

  def quit
    Rails.logger.info 'Closing Driver'
    @driver.quit
  end

  private

  def assign_values(elements)
    elements.each do |element|
      title = element.find_element(:css, 'h4').text
      company = element.find_element(:css, 'div.company.hidden-xs').text
      link = element.find_element(:css, 'h4').find_element(:css, 'a').attribute('href')
      website = 'WorkingNomands'
      Position.create!(title:, company:, link:, website:) if Position.find_by(link:).nil?
    end
  end
end
