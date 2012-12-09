class AddPositionToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :position, :string
  end
end
