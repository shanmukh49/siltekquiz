class Subject < ActiveRecord::Base
   attr_accessible :subject_id, :subject
   has_many :questions
has_many :users
   def to_s
    subject
  end
   #belongs_to :user
end
