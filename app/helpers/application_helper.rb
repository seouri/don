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
    digits = number <= 0 ? 0 : Math.log10(number.to_i).to_i
    sig = ("%.1f" % (number.to_f / 10 ** digits)).to_f
    diff = digits - (digits / 3 * 3)
    human = sig * 10 ** diff
    human = diff == 0 ? sprintf("%.1f", human) : sprintf("%d", human) 
    case
      when digits < 3;  human = "$#{number}"
      when digits < 6;  human = "$%.3s K" % human
      when digits < 9;  human = "$%.3s M" % human
      when digits < 12; human = "$%.3s B" % human
      when digits < 15; human = "$%.3s T" % human
      else human = "$#{number}"
    end
  end
end
