class AddQuestionIdToExams < ActiveRecord::Migration
  def change
    add_column :exams, :question_id, :integer
  end
end
