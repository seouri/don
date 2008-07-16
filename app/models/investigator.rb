class Investigator < ActiveRecord::Base
  has_many :grants, :order => "grants.year desc"
  has_many :organizations, :through => :grants
  
  def years
    awarded_years.split(/, /).map {|year| year.to_i}
  end
  
end
