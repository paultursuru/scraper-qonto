### Scraping Qonto
run `ruby app.rb` to start scraping pages contained in pages.json

a new instance of Scraper is created for each page/url
Scraper checks if page is Prismic or not, then starts parsing html with Nokogiri.

Each Page has many Sections with many Items
