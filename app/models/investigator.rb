class Investigator < ActiveRecord::Base
  has_many :grants, :order => "grants.year desc, grants.award desc", :include => [:activity, :organization]
  has_many :organizations, :through => :grants, :uniq => true
  has_many :activities, :through => :grants, :uniq => true
    
  def years
    awarded_years.split(/, /).map {|year| year.to_i}
  end
  
  def self.search(query, options = {})
    options[:conditions] ||= ["#{Investigator.table_name}.name LIKE ?", "#{query}%"] unless query.blank?
    options[:order] ||= "#{Investigator.table_name}.award_total desc"
    options[:per_page] ||= 10
    options[:page] ||= 1
    paginate options
  end
end
