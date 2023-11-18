class RubyOnRemoteMidLevel < Driver

  SEARCH_KEY = "https://rubyonremote.com/mid-level-remote-jobs/"

  def search
    p 'Starting Ruby On Remote Mid Level search'

    @driver.navigate.to SEARCH_KEY
    begin
      elements = @driver.find_element(:css, "main").find_elements(:css, 'ul')[1].find_elements(:css, 'li')
      elements.each do |element|
        title = element.find_element(:class, 'text-lg').text
        company = element.find_element(:class, 'text-base').text
        link = element.find_element(:css, 'a').attribute("href")
        website = 'RubyOnRemoteMidLevel'
        if Position.find_by(link:).nil?
          Position.create!(title:, company:, link:, website:)
        end
      end

      p 'Search finished'
    rescue => e
      p e.message
    end
  end

  def quit
    p 'Closing Driver'

    @driver.quit
  end
end