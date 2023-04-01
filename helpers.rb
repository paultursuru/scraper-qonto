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

def puts_section(section)
  puts "--------------------"
  puts "Section #{section.id}"
  section.items.each do |item|
    puts_item(item)
  end
end

def generate_hash_with(pages_array)
  {
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
end
