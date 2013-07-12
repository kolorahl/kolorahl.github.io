module Jekyll
  module ExcerptFilter
    def excerpt(post)
      content = post["content"].strip
      excerpt = content[0, (content.index("</p>"))]
      # The +4 is to account for the ending "</p>" that isn't captured
      if (excerpt.length + 4) < content.length
        "#{excerpt} <a href=\"#{post["url"]}\">More &gt;</a></p>"
      else
        "#{excerpt}</p>"
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::ExcerptFilter)
