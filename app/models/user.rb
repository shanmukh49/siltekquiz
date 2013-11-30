class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
validates_presence_of :mobile_no, :first_name, :school_name
validates_length_of :mobile_no, :minimum => 10, :maximum => 10, :allow_blank => true


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :subject_id,:school_name, :mobile_no,:time
  # attr_accessible :title, :body
  has_one :result
  # has_many :types
   has_many :questions, :through => :types
  belongs_to :subject
after_initialize :init

    def init
      self.time  ||= 1500          #will set the default value only if it's nil
      
    end
end
