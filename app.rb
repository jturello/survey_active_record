require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/survey")
require("./lib/question")
require("pg")

get('/') do
  @page_title = "Welcome to the Survey App!"
  @surveys = Survey.all()
  erb(:index)
end

get('/surveys/new') do
  @page_title = "New Survey"
  erb(:new_survey)
end

post('/surveys/new') do
  @page_title = "Welcome to the Survey App!"
  title = params.fetch("title")
  survey = Survey.create({:title => title})
  @surveys = Survey.all()
  erb(:index)
end

get('/surveys/:id') do
  @survey = Survey.find(params[:id].to_i)
  erb(:survey)
end

patch('/surveys/:id') do
  @survey = Survey.find(params[:id].to_i)
  title = params.fetch('new_title')
  @survey.update({:title => title})
  erb(:survey)
end

delete("/surveys/:id") do
  @page_title = "Welcome to the Survey App!"
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.delete()
  @surveys = Survey.all()
  erb(:index)
end
