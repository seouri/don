class Activity < ActiveRecord::Base
  
  def category_code
    code.slice(0, 1)
  end
end
