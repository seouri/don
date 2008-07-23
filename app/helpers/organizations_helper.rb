module OrganizationsHelper
  def award_chart(grants)
    y = grants.map {|g| g.year.to_i}.sort
    years = (y.first .. y.last).to_a
    awards = years.map {|y| g = grants.detect {|g| g.year == y}; g.nil? ? 0 : g.awards.to_i }
    label = years.map {|y| years.index(y) % 2 == 1 ? "" : y }
    width = 60 + years.size * 14
    max = number_to_human_currency(awards.sort.last)
    url = Gchart.bar(:data => awards, :axis_with_labels => 'x,y', :axis_labels => [label, [0, max]], :size => "#{width}x80", :bar_colors => '999999', :bar_width_and_spacing => '8,6')
    image_tag(url, :alt => "Awards by Year")
  end
  
  def category_chart(categories)
    non_other = categories.size > 3 ? 2 : categories.size - 1
    category_names = categories[0 .. non_other].map {|g| g[:category]}
    awards = categories[0 .. non_other].map {|g| g[:awards].to_i}
    if categories.size > 4
      last = categories.size - 1
      category_names.push("Other")
      awards.push(categories[4 .. last].sum {|c| c[:awards].to_i})
    end    
    width = 84 + category_names.max {|a, b| a.length <=> b.length }.length * 6 * 2
    url = Gchart.pie(:data => awards, :labels => category_names, :size => "#{width}x80", :custom => 'chco=999999')
    image_tag(url, :alt => "Awards by Category")
  end
end
