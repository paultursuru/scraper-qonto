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

pages_array = []

pages.each do |page|
  scraped_page = Scraper.new(url: page.dig('url')).scrape
  next if scraped_page.nil?

  pages_array << scraped_page
end

pages_hash = {
  "pages" => pages_array.map do |page|
    {
      "url" => page.url,
      "name" => page.name,
      "sections" => page.sections.map do |section|
        {
          "id" => section.id,
          "classes" => section.classes,
          "items" => section.items.map do |item|
            {
              "tag" => item.tag,
              "content" => item.content,
              "id" => item.id,
              "classes" => item.classes,
              "href" => item.href,
              "src" => item.src
            }
          end
        }
      end
    }
  end
}

File.open("scrapped_pages.json", "w") do |f|
  f.write(JSON.pretty_generate(pages_hash))
end

