# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def smart_year(years)
    years.join(", ")
  end
end
