require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/survey")
require("./lib/question")
require("./lib/answer")
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

post("/surveys/:id/question") do
  survey_id = params.fetch("survey_id").to_i()
  name = params.fetch("question_name")
  question = Question.create({:name => name, :survey_id => survey_id})
  @survey = Survey.find(params.fetch("id").to_i())
  @surveys = Survey.all()
  @questions = Question.all()
  erb(:survey)
end

get('/questions/:id') do
  @question = Question.find(params.fetch("id").to_i())
  @questions = Question.all()
  @answers = Answer.all()
  erb(:question)
end

post('/questions/:id/answer') do
  question_id = params.fetch("question_id").to_i()
  name = params.fetch("answer_name")
  @question = Question.find(params.fetch("id").to_i())
  answer = Answer.create({:name => name, :question_id => question_id})
  @answers = Answer.all()
  erb(:question)
end

get('/surveys/:id/take') do
  @survey = Survey.find(params.fetch("id").to_i())
  @surveys = Survey.all()
  @questions = Question.all()
  @answers = Answer.all()
  erb(:take_survey)
end
