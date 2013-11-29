class CreateResults < ActiveRecord::Migration
  def change
    create_table :results, {:id => false} do |t| 
      t.string :email
      t.integer :score
      t.integer :time
    end
  end
end
