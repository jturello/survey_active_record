require('sinatra/activerecord')

class Answer < ActiveRecord::Base
  belongs_to(:question)
  validates(:name, :presence => true)
end
