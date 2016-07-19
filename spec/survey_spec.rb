require('spec_helper')

describe(Survey) do

  it('validates presence of title on save') do
    survey = Survey.new({:title => ""})
    expect(survey.save()).to eq(false)
  end

  describe("#questions") do
    it "tells which questions are in the survey" do
      test_survey = Survey.create({:title => "Favorite Programming Language"})
      test_question1 = Question.create({:name => "What is your favorite programming language?", :survey_id => test_survey.id()})
      expect(test_survey.questions()).to(eq([test_question1]))
    end
  end

  describe("#capitalize_title") do
    it "capitalizes the title of the survey" do
      test_survey = Survey.create({:title => "favorite Programming Language"})
      expect(test_survey.title()).to(eq("Favorite Programming Language"))
    end
  end
end
