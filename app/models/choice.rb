

class Choice < ActiveRecord::Base
 attr_accessible :question_id,:text,:correct
  belongs_to :question

end
