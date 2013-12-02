 

class QuizController < ApplicationController
  before_filter :authenticate_user!
  def index

  if current_user.result.nil?
total = 25
@id = current_user.subject_id
 all = Question.where(subject_id: @id)
 session[:questions] = all.sort_by{rand}[0..(total-1)]

	 session[:total]   = total
	 session[:current] = 0
	 session[:correct] = 0
 redirect_to :action => "question"
  else
    redirect_to :action => "submitresult"
  end
  end
  
#  def start
#	 total = params[:number].to_i
#	 all = Question.find(:all).map {|x| x.id}
#	 session[:questions] = all.sort_by{rand}[0..(total-1)]
#
#	 session[:total]   = total
#	 session[:current] = 0
#	 session[:correct] = 0
#
#	 redirect_to :action => "question"
#  end
  def question
          
         
	 @current = session[:current]
	 @total   = session[:total]
	 if @current >= @total 
		redirect_to :action => "submitresult"
		return
	 end
	
	 @question = Question.find(session[:questions][@current])


	 # @choices = @question.choices.sort_by{rand}
	 @choices = @question.choices
	 
	 session[:question] = @question
	 session[:choices] = @choices
	 
	 
	
  end

  def answer
	 @current = session[:current]
	 @total   = session[:total]
	 
	 choiceid = params[:choice]
	 
	 @question = session[:question]
	 @choices  = session[:choices]
	 UserAnswer.create(:question_id=>session[:question].id,:choice_id=>choiceid)
	 @choice = choiceid ? Choice.find(choiceid) : nil
	 if @choice and @choice.correct
		@correct = true
		session[:correct] += 1
	 else
		@correct = false
	 end
   puts "=======iam in answer time inspect ==========="
puts params[:time].inspect
    current_user.time=params[:time]
    current_user.save
	 session[:current] += 1
   redirect_to :action=>"question"
  end

  def end

	 @correct = session[:correct]

	 
	 @score = @correct 
  end
  
  
  def submitresult
  	puts "//////////////////hi//////////////////////////////"
  	time_taken = 1500 - current_user.time.to_i
    if (current_user.result).nil?
    @addresult = Result.new 
     @correct = session[:correct]
    @addresult.score=@correct
  @total   = session[:total]
    @addresult.user_id = current_user.id
    @addresult.first_name = current_user.first_name
    @addresult.email = current_user.email
    @addresult.time = time_taken
    @addresult.save
    else
      render :text=>"you have already submitted exam", :layout=>true
    end
    
end

  

end
