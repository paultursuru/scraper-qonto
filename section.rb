class Section
  attr_reader :page, :position, :classes, :items

  def initialize(attr = {})
    @page           = attr.dig(:page)
    @position       = attr.dig(:position)
    @classes        = attr.dig(:classes)
    @items          = []
    @page.sections  << self
  end
end
