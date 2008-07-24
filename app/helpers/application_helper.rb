# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def grant_legend(grants)
    categories = grants.map { |g| g.activity}.sort {|a,b| a.category <=> b.category }.map {|a| content_tag(:td, a.category, :class => a.category_code)}.uniq
    content_tag(:table, content_tag(:tr, categories.join("")), :class => "legend")
  end

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
    digits = number <= 0 ? 0 : Math.log10(number.to_i)
    case
      when digits < 3; "$#{number}"
      when digits < 6; "$%.1f K" % (number.to_f / 10 ** 3)
      when digits < 9; "$%.1f M" % (number.to_f / 10 ** 6)
      when digits < 12; "$%.1f B" % (number.to_f / 10 ** 9)
      else "$#{number}"
    end
  end
end
