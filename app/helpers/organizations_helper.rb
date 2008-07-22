module OrganizationsHelper
  def award_chart(grants)
    years = grants.map {|g| g.year.to_i}
    awards = grants.map {|g| g.awards.to_i}
    label = years.map {|y| years.index(y) % 2 == 1 ? "" : y }
    width = 60 + years.size * 14
    max = number_to_human_currency(awards.sort.last)
    url = Gchart.bar(:data => awards, :axis_with_labels => 'x,y', :axis_labels => [label, [0, max]], :size => "#{width}x80", :bar_colors => '999999', :bar_width_and_spacing => '8,6')
    image_tag(url, :alt => "Awards by Year")
  end
  
  def category_chart(grants)
    non_other = grants.size > 3 ? 2 : grants.size - 1
    categories = grants[0 .. non_other].map {|g| g.category}
    awards = grants[0 .. non_other].map {|g| g.awards.to_i}
    if grants.size > 4
      last = grants.size - 1
      categories.push("Other")
      awards.push(grants[4 .. last].sum {|c| c.awards.to_i})
    end    
    width = 84 + categories.max {|a, b| a.length <=> b.length }.length * 6 * 2
    url = Gchart.pie(:data => awards, :labels => categories, :size => "#{width}x80", :custom => 'chco=999999')
    image_tag(url, :alt => "Awards by Category")
  end
end
