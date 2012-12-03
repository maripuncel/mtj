class AddPositionToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :position, :string
  end
end
