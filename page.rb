class Page
  attr_reader :url, :sections, :items, :name

  def initialize(attr = {})
    @url      = attr.dig(:url)
    @name     = attr.dig(:name)
    @sections = []
  end

  def items
    @items ||= self.sections.map(&:items).flatten
  end
end
