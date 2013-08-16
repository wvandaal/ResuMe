class ChangeGpaColumnInDegreesToFloat < ActiveRecord::Migration
  def change
	change_column :degrees, :gpa, :float
  end
end
