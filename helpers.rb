def is_a_section?(element)
  element.attributes["id"]&.value&.include?("section")
end

def tags
  %w[h1 h2 h3 h4 h5 h6 p a img]
end

def puts_item(item)
  case item.tag
  when "img"
    puts "<#{item.tag} id='#{item.id}' class='#{item.classes}' src='#{item.src}'/>"
  when "a"
    puts "<#{item.tag} id='#{item.id}' class='#{item.classes}' href='#{item.href}'>#{item.content}</#{item.tag}>"
  else
    puts "<#{item.tag} id='#{item.id}' class='#{item.classes}'>#{item.content}</#{item.tag}>"
  end
end
