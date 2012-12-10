class AddCategorycodeToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :categorycode, :string
  end
end
