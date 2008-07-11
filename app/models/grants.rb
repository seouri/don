class Grants < ActiveRecord::Base
  belongs_to :organization
  belongs_to :investigator
end
