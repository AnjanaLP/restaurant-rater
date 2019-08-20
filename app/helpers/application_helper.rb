module ApplicationHelper

  def full_title(title = "")
    base_title = "Restaurant Rater"
    title.empty? ? base_title : "#{base_title} | #{title}"
  end
end
