
class Question < ActiveRecord::Base
  attr_accessible :text,:subject_id,:avatar
  has_many :choices
  has_many :result, :through=>:user_answers
  has_one :user_answer
  belongs_to :subject
has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  #has_many :users, :through => :types
  #set_primary_key 'type'
  def answer
	 uncorrect
	 choices.select {|c| c.correct}[0]
  end	
  
  def uncorrect
	 choices.each {|c| c.correct = false}
  end
  
  def answer= choice
	 if !answer.nil?
		answer.correct = false
	 end
	 
	 if choices.include? choice
		choice.correct = true
	 else
		choices << choice
		choice.correct = true
	 end
  end
  def to_s
    text
  end
end
