class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
t.integer :question_id
t.integer :choice_id
      
    end
  end
end
