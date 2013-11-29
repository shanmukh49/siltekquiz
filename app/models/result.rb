class Result < ActiveRecord::Base
  # attr_accessible :title, :body
attr_accessible :u_email,:score,:question_id,:user_id,:u_time,:u_name
  has_many :questions, :through=>:user_answers
  has_many :user_answers
  belongs_to :user
  set_primary_key 'score'
#set_primary_key :email
#set_primary_key :score
  #has_one :question_id
  def u_email
    (self.user).email
  end
  def u_time
  	(self.user).time
  end
  def u_name
    (self.user).first_name
  end
  
end
