class Item
  attr_reader :section, :tag, :content, :id, :classes, :href, :src

  def initialize(attr = {})
    @section  = attr.dig(:section)
    @tag      = attr.dig(:tag)
    @content  = attr.dig(:content)
    @id       = attr.dig(:id)
    @classes  = attr.dig(:classes)
    @href     = attr.dig(:href)
    @src      = attr.dig(:src)
    @section.items << self
  end
end
