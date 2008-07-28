class Activity < ActiveRecord::Base
  has_many :organizations, :through => :grants
  
  def self.categories(organization)
    activity_ids = find_by_sql "select activity_id, sum(award) as awards from grants where organization_id = #{organization.id} and activity_id > 0 group by activity_id order by sum(award) desc;"
    activities = find activity_ids.map {|a| a.activity_id}
    categories = {}
    activities.each do |a|
      category = a.category
      categories[category] ||= 0;
      categories[category] += activity_ids.find {|x| x.activity_id = a.id}.awards.to_i
    end
    categories.sort {|a, b| b[1] <=> a[1]}.map {|x| { :category => x[0], :awards => x[1]}}
  end
  
  def category_code
    code.slice(0, 1)
  end
end
