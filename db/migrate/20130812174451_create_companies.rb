class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :logo
      t.string :location

      t.timestamps
    end
  end
end
