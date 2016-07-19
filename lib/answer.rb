require('sinatra/activerecord')
class Answer < ActiveRecord::Base
  belongs_to(:question)
end
