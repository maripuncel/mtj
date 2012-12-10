class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.boolean :question
      t.integer :question_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
