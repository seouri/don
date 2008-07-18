class Grant < ActiveRecord::Base
  belongs_to :organization
  belongs_to :investigator
  belongs_to :activity
  
  named_scope :recent, :order => "grants.year desc, grants.award desc", :limit => 10, :include => :investigator
  
  def grant_type
    grant_number.gsub(/^\d/, '').slice(0, 3)
  end
end
