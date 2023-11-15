class RemoteCo

  def initialize
    require "selenium-webdriver"

    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--ignore-certificate-errors')
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--disable-translate')

    @driver = Selenium::WebDriver.for(
      :remote,
      url: "http://#{ENV['SELENIUM_HOST']}:4444/wd/hub",
      options: options
      )
  end

  def search
    @driver.navigate.to "https://remote.co/remote-jobs/search/?search_keywords=ruby"

    wait = Selenium::WebDriver::Wait.new
    begin
      wait.until { @driver.find_elements(:class, "job_listings")[-1].text != "Loading..." }
      elements = @driver.find_elements(:class, "job_listings")[-1].find_elements(:class, "card ")
      elements.each do |element|
        title = element.find_elements(:class, 'm-0')[0].text
        company = element.find_elements(:class, 'm-0')[1].text.split('|')[0].strip
        link = element.find_element(:css, 'a').attribute("href")
        website = "remote.co"
        if ::Model::Job.find_by(link: link).nil?
          ::Model::Job.create!(title:, company:, link:, website:)
        end
      end
    rescue => e
      p "#{e.message}"
    ensure
      @driver.quit
    end
  end
end

remote_co = RemoteCo.new
remote_co.search