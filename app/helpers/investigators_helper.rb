module InvestigatorsHelper
  def grant_by_year(grants)
    html = []
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
    width = 80 + years.size * 28
    max_award = number_to_currency(awards.sort.last, :precision => 0)
    url = Gchart.bar(:data => awards, :axis_with_labels => 'x,y', :axis_labels => [years, [0, max_award]], :size => "#{width}x80", :bar_colors => '999999')
    image_tag(url)
  end

  def grant_by_activity(grants)
    html = []
    stat = grants.group_by {|g| g.activity.code }
    codes = stat.keys.sort
    awards = []
    codes.each do |code|
      award = stat[code].sum {|g| g.award}
      awards.push(award)
    end
    url = Gchart.pie(:data => awards, :labels => codes, :size => '150x80')
    image_tag(url)
  end
end
