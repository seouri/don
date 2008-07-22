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
          consecutive.push(", ") if consecutive.last == years[index - 1]
          consecutive.push(year)
        elsif year == years[index - 1] + 1 and year == years[index + 1] - 1
          consecutive.push("-") unless consecutive.last == "-"
        elsif year == years[index - 1] + 1 and year != years[index + 1] - 1
          consecutive.push(", ") if consecutive.last == years[index - 1]
          consecutive.push(year)
          consecutive.push(", ")
        elsif year != years[index - 1] + 1 and year == years[index + 1] - 1
          consecutive.push(", ") if consecutive.last == years[index - 1]
          consecutive.push(year)
        elsif year != years[index - 1] + 1 and year != years[index + 1] - 1
          consecutive.push(", ") if consecutive.last == years[index - 1]
          consecutive.push(year)
          consecutive.push(", ")
        end
      end
      consecutive.join("")
    end
  end

  def number_to_human_currency(number)
    digits = Math.log10(number)
    case
      when digits < 3; number
      when digits < 6; "$%.1f K" % (number / 10 ** 3)
      when digits < 9; "$%.1f M" % (number / 10 ** 6)
      when digits < 12; "$%.1f B" % (number / 10 ** 9)
      else number
    end
  end
end
