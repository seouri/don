class Organization < ActiveRecord::Base
  has_many :grants
  has_many :investigators, :through => :grants
end
