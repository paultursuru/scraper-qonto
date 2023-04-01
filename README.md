### Scraping Qonto
Run `ruby app.rb` to start scraping pages contained in pages.json

A new instance of Scraper is created for each page/url.
Scraper checks if page is Prismic or not, then starts parsing html with Nokogiri.
Each Page has many Sections with many Items.

The output is a JSON file containing all Pages, Sections and Items.
