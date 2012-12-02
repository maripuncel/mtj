class AddRatingToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :questions, :text
    add_column :interviews, :rating, :float
  end
end
