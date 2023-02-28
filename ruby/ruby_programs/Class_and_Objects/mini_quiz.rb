=begin
  Ques=> mini Quiz
=end

class MiniQuiz
  attr_accessor :ques, :ans
  def initialize (ques,ans)
      @ques =ques
      @ans = ans
  end
end
q1 = "Capital of India:\na) Delhi\nb) Faridabad\nc) Jaipur\nd) Pune"
q2 = "National Flower:\na) Rose\nb) Lily\nc) Lotus\nd) Sunflower"
q3 = "National Animal:\na) Lion\nb) Camel\nc) Horse\nd) Tiger"

questions = [
  MiniQuiz.new(q1,"a"),
  MiniQuiz.new(q2,"c"),
  MiniQuiz.new(q3,"d")
]

def quiz(questions)
  score=0
  ans=""
  for question in questions
      puts question.ques
      ans = gets.chomp()
      if(ans==question.ans)
          score= score+1
      end
  end
  puts "\nResult: #{score}/#{questions.length}"
end

quiz(questions)