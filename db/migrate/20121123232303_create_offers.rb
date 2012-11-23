class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :figure
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end
