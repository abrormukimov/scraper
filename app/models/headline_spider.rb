require 'kimurai'
require 'uri'

class HeadlineSpider < Kimurai::Base
  @name = "Headline Spider"
  @engine = :selenium_firefox
  @config = {
    skip_duplicate_requests: true
  }

  def self.process(url, number_of_pages)
    num = 2
    urls = []
    number_of_pages.times do
      urls << url + "page/#{num}"
      num += 1
    end
    @start_urls = [url].concat(urls)
    self.crawl!
  end

  def parse(response, url:, data: {})
    @base_url = 'https://www.smashingmagazine.com'
    response = browser.current_response
    response.css('article.article--post h2.article--post__title a').each do |app|
      num = 2
      href = app.attr('href')
      browser.visit(@base_url + href)
      app_response = browser.current_response
      # next unless unique?(href, app.attr('href'))
      scrape_page(app_response, href)
    end
  end

  private

  def scrape_page(response, href)
    item = {}
    item[:headline] = response.css('h1#main-heading')&.text&.squish
    item[:published_at] = response.css('time.article-header--date')&.text&.squish
    item[:url] = href.strip! || href
    
    article = Article.find_or_initialize_by(headline: item[:headline])
    article.published_at = item[:published_at]
    article.url = item[:url]
    article.save!
  end
end

# HeadlineSpider.process("https://www.smashingmagazine.com/articles/")
