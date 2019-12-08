module ApplicationHelper

  def full_title(page_title)
    base_title = "Learning time App"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def all_hour
    beginning_of_hour..end_of_hour
  end
end
