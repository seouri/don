class Investigator < ActiveRecord::Base
  has_many :grants
  has_many :organizations, :through => :grants
end
