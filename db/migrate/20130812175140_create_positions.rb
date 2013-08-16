class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.string :location
      t.integer :company_id
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
