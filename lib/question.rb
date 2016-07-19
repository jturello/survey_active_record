class Question < ActiveRecord::Base
  belongs_to(:survey)
  validates(:name, :presence => true)
end
