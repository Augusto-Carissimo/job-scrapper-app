class RemoteCo < Driver

  SEARCH_KEY = "https://remote.co/remote-jobs/search/?search_keywords=ruby"

  def search
    @driver.navigate.to SEARCH_KEY
    wait = Selenium::WebDriver::Wait.new
    begin
      wait.until { @driver.find_elements(:class, "job_listings")[-1].text != "Loading..." }
      elements = @driver.find_elements(:class, "job_listings")[-1].find_elements(:class, "card ")
      elements.each do |element|
        title = element.find_elements(:class, 'm-0')[0].text
        company = element.find_elements(:class, 'm-0')[1].text.split('|')[0].strip
        link = element.find_element(:css, 'a').attribute("href")
        website = "remote.co"
        if Position.find_by(link: link).nil?
          Position.create!(title:, company:, link:, website:)
        end
      end
    rescue => e
      p e.message
    end
  end

  def quit
    p 'Quitting driver'
    @driver.quit
  end
end
