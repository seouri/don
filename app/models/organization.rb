class Organization < ActiveRecord::Base
  has_many :grants, :include => :activity
  has_many :awards_by_year, :class_name => "Grant", :group => :year, :select => "year, sum(award) as awards, count(*) as grants"
  has_many :investigators, :through => :grants, :uniq => true
  
  def years
    awarded_years.split(/, /).map {|year| year.to_i}
  end
  
  def self.search(query, options = {})
    options[:conditions] ||= ["#{Organization.table_name}.name LIKE ?", "#{query}%"] unless query.blank?
    options[:order] ||= "#{Organization.table_name}.award_total desc"
    options[:per_page] ||= 10
    options[:page] ||= 1
    options[:total_entries] ||= Organization.last.id if query.blank? && ! Organization.last.nil?
    paginate options
  end
end
