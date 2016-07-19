require('spec_helper')

describe(Question) do
  it "validates presence of name" do
    test_question1 = Question.create({:name => "", :survey_id => 1})
    expect(test_question1.save()).to(eq(false))
  end

  describe("#survey") do
    it "tells which survey the question is in" do
      test_survey = Survey.create({:title => "Favorite Programming Language"})
      test_question1 = Question.create({:name => "What is your favorite programming language?", :survey_id => test_survey.id()})
      expect(test_question1.survey()).to(eq(test_survey))
    end
  end
end
