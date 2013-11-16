class AddExamIdToUserAnswers < ActiveRecord::Migration
  def change
    add_column :user_answers, :exam_id, :integer
  end
end
