module ApplicationHelper

def full_title(page_title)
    base_title = "SageWanted"
    if page_title.empty?
      "SageWanted"
    else
      "#{page_title} | #{base_title}"
    end
  end

end
