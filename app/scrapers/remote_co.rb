class RemoteCo < Driver

  SEARCH_KEY = "https://remote.co/remote-jobs/search/?search_keywords=ruby"

  def search
    Rails.logger.info 'Starting Remote.Co search'

    @driver.navigate.to SEARCH_KEY
    wait = Selenium::WebDriver::Wait.new
    begin
      wait.until { @driver.find_elements(:class, "job_listings")[-1].text != "Loading..." }
      elements = @driver.find_elements(:class, "job_listings")[-1].find_elements(:class, "card ")
      elements.each do |element|
        info = element.find_elements(:class, 'm-0')
        title = info[0].text
        company = info[1].text.split('|')[0].strip
        link = element.find_element(:css, 'a').attribute("href")
        website = "remote.co"
        if Position.find_by(link:).nil?
          Position.create!(title:, company:, link:, website:)
        end
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
