class Question < ActiveRecord::Base
  belongs_to(:survey)
  has_many(:answers)
  validates(:name, :presence => true)
end
