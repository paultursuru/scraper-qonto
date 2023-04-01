class Scraper
  attr_reader :url

  def initialize(attr = {})
    @url = attr.dig(:url)
  end

  def scrape
    html_file = URI.open(@url).read
    html_doc = Nokogiri::HTML.parse(html_file)
    html_doc.search(".prismic").any? ? parse(html_doc) : nil # Check if it's a prismic page
  end

  def parse(html_doc)
    page = Page.new(url: self.url)

    html_doc.search("section").each do |element|
      next unless is_a_section?(element)

      section = Section.new(page: page, id: element.attributes["id"]&.value, classes: element.attributes["class"]&.value)

      element.traverse do |node|
        Item.new( section: section,
                  tag: node.name,
                  content: node.inner_html,
                  id: node.attributes["id"]&.value,
                  classes: node.attributes["class"]&.value,
                  href: node.attributes["href"]&.value,
                  src: node.attributes["src"]&.value
                ) if node.is_a?(Nokogiri::XML::Element) && tags.include?(node.name) && !node.inner_html.empty?
              end
    end
    page
  end
end
