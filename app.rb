require_relative 'scraper'
require_relative 'page'
require_relative 'section'
require_relative 'item'
require_relative 'helpers'

require "open-uri"
require "nokogiri"
require "json"

# read the pages.json file
serialized_pages = File.read("pages.json")
pages = JSON.parse(serialized_pages).dig("pages")

# scrape each page and store the result in an array
pages_array = []
pages.each do |page|
  scraped_page = Scraper.new(url: page.dig('url')).scrape
  next if scraped_page.nil?

  pages_array << scraped_page
end

# generate a hash with the scraped pages
pages_hash = generate_hash_with(pages_array)

# write the hash to a json file
File.open("scraped_pages.json", "wb") do |f|
  f.write(JSON.pretty_generate(pages_hash))
end
