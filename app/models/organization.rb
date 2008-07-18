class Organization < ActiveRecord::Base
  has_many :grants, :order => "grants.year desc, grants.award desc"
  has_many :investigators, :through => :grants, :uniq => true, :order => "investigators.award_total desc", :limit => 10
  
  def years
    awarded_years.split(/, /).map {|year| year.to_i}
  end
  
  def self.search(query, options = {})
    options[:conditions] ||= ["#{Organization.table_name}.name LIKE ?", "#{query}%"] unless query.blank?
    options[:order] ||= "#{Organization.table_name}.award_total desc"
    options[:per_page] ||= 10
    options[:page] ||= 1
    paginate options
  end
end
