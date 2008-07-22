class Activity < ActiveRecord::Base
  has_many :organizations, :through => :grants
  
  def category_code
    code.slice(0, 1)
  end
end
