require_relative 'scraper'
require_relative 'page'
require_relative 'section'
require_relative 'item'
require_relative 'helpers'

require "open-uri"
require "nokogiri"
require "json"

serialized_pages = File.read("pages.json")
pages = JSON.parse(serialized_pages).dig("pages")

pages.each do |page|
  puts "===================="
  puts "Scraping #{page.dig('url')}"
  scrapped_page = Scraper.new(url: page.dig('url')).scrape
  if scrapped_page.nil?
    puts "Probably not a prismic page"
    next
  end
  puts "Sections : #{scrapped_page.sections.count}"
  puts "Items : #{scrapped_page.items.count}"
  puts "First Section tags :"
  scrapped_page.sections.first.items.each do |item|
    puts_item(item)
  end
end
