# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def smart_year(years)
    if years.size < 3
      return years.join(", ")
    else
      consecutive = []
      years.each do |year|
        index = years.index(year)
        if index == 0
          consecutive.push(year)
        elsif index == years.size - 1
          consecutive.push(year)
        elsif year == years[index - 1] + 1 and year == years[index + 1] - 1
          consecutive.push("-") unless consecutive.last == "-"
        elsif year == years[index - 1] + 1 and year != years[index + 1] - 1
          consecutive.push(", ") if consecutive.last == years[index - 1]
          consecutive.push(year)
          consecutive.push(", ")
        elsif year != years[index - 1] + 1 and year == years[index + 1] - 1
          consecutive.push(year)
        elsif year != years[index - 1] + 1 and year != years[index + 1] - 1
          consecutive.push(year)
          consecutive.push(", ")
        end
      end
      consecutive.join("")
    end
  end
end
