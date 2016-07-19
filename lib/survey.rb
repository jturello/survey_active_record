require('sinatra/activerecord')
class Survey < ActiveRecord::Base
  has_many(:questions)
  before_save(:capitalize_title)
  validates(:title, :presence => true)

private
  define_method(:capitalize_title) do
    self.title=(title().titleize())
  end
end
