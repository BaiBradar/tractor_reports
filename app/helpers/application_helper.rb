module ApplicationHelper
  def title
    base_title = "Tractor's Heaven"
    if @title
      base_title + " | #{@title}"
    else
      base_title
    end
  end
end
