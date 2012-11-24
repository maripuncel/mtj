class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end
