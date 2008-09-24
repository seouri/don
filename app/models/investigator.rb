class Investigator < ActiveRecord::Base
  has_many :grants, :order => "grants.year desc, grants.award desc", :include => [:activity, :organization]
  has_many :organizations, :through => :grants, :uniq => true
  has_many :activities, :through => :grants, :uniq => true
    
  named_scope :top_awards, :order => "award_total desc", :limit => 10
  
  def years
    awarded_years.split(/, /).map {|year| year.to_i}
  end

  def self.search(query, options = {})
    options[:conditions] ||= ["#{Investigator.table_name}.name LIKE ?", "#{query}%"] unless query.blank?
    options[:order] ||= "#{Investigator.table_name}.award_total desc"
    options[:per_page] ||= 10
    options[:page] ||= 1
    options[:total_entries] ||= Investigator.last.id if query.blank? && ! Investigator.last.nil?
    paginate options
  end
end
