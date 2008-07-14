class Investigator < ActiveRecord::Base
  has_many :grants, :order => "grants.year desc"
  has_many :organizations, :through => :grants
end
