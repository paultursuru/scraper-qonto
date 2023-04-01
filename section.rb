class Section
  attr_reader :page, :id, :classes, :items

  def initialize(attr = {})
    @page           = attr.dig(:page)
    @id             = attr.dig(:id)
    @classes        = attr.dig(:classes)
    @items          = []
    @page.sections  << self
  end
end
