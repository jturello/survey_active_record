require('spec_helper')

describe(Answer) do
  describe("#question") do
    it "tells which question the answer belongs to" do
      test_question1 = Question.create({:name => "What is your favorite programming language?", :survey_id => 1})
      test_answer1 = Answer.create({:name => "Ruby", :question_id => test_question1.id()})
      expect(test_question1.answers()).to(eq([test_answer1]))
      expect(test_answer1.question()).to(eq(test_question1))
    end
  end
end
