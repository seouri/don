class Organization < ActiveRecord::Base
  has_many :grants
  has_many :investigators, :through => :grants
  
  def years
    awarded_years.split(/, /).map {|year| year.to_i}
  end
  
end
