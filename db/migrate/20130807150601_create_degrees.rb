class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :field
      t.string :type
      t.date :start_date
      t.date :end_date
      t.string :concentration
      t.text :details
      t.integer :gpa
      t.integer :school_id
      t.integer :user_id

      t.timestamps
    end
  end
end
