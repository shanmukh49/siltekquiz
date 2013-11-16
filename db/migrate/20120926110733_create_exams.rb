class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams, {:id => false} do |t| 
      t.string :email
      t.integer :score
    end
  end
end
