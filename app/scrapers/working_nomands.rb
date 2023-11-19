class WorkingNomands < Driver

  SEARCH_KEY = "https://www.workingnomads.com/jobs?tag=ruby"

  def search
    Rails.logger.info 'Starting Working Nomads search'

    @driver.navigate.to SEARCH_KEY
    begin
      elements = @driver.find_element(:class, "jobs-list").find_elements(:class, 'ng-scope')
      elements.each do |element|
        title = element.find_element(:css, 'h4').text
        company = element.find_element(:css, 'div.company.hidden-xs').text
        link = element.find_element(:css, 'h4').find_element(:css, 'a').attribute("href")
        website = 'WorkingNomands'
        if Position.find_by(link:).nil?
          Position.create!(title:, company:, link:, website:)
        end
      rescue => e
        Rails.logger.warn e.message
      end

      Rails.logger.info 'Search finished'
    rescue => e
      Rails.logger.warn e.message
    end
  end

  def quit
    Rails.logger.info 'Closing Driver'

    @driver.quit
  end
end
