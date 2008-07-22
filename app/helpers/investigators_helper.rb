module InvestigatorsHelper
  def grant_by_year(grants)
    stat = grants.group_by {|g| g.year }
    y = stat.keys.sort
    years = (y.first .. y.last).to_a
    awards = []
    grants = []
    years.each do |year|
      award = stat[year].nil? ? 0: stat[year].sum {|g| g.award}
      grant = stat[year].nil? ? 0: stat[year].size
      awards.push(award)
      grants.push(grant)
    end
    width = 60 + years.size * 14
    max_award = number_to_human_currency(awards.sort.last)
    label = years.map {|y| years.index(y) % 2 == 1 ? "" : y }
    url = Gchart.bar(:data => awards, :axis_with_labels => 'x,y', :axis_labels => [label, [0, max_award]], :size => "#{width}x80", :bar_colors => '999999', :bar_width_and_spacing => '8,6')
    image_tag(url, :alt => "Awards by Year")
  end

  def grant_by_activity(grants)
    stat = grants.group_by {|g| g.activity.code }
    codes = stat.keys.sort
    awards = []
    codes.each do |code|
      award = stat[code].sum {|g| g.award}
      awards.push(award)
    end
    url = Gchart.pie(:data => awards, :labels => codes, :size => '150x80', :custom => 'chco=999999')
    image_tag(url, :alt => "Awards by Activity")
  end

  def grant_by_category(grants)
    stat = grants.group_by {|g| g.activity.category}
    categories = stat.keys.sort
    awards = []
    categories.each do |category|
      award = stat[category].sum {|g| g.award}
      awards.push(award)
    end
    width = 84 + categories.max {|a, b| a.length <=> b.length }.length * 6 * 2
    url = Gchart.pie(:data => awards, :labels => categories, :size => "#{width}x80", :custom => 'chco=999999')
    image_tag(url, :alt => "Awards by Category")
  end
end
