class AddResultIdToUserAnswers < ActiveRecord::Migration
  def change
    add_column :user_answers, :result_id, :integer
  end
end
