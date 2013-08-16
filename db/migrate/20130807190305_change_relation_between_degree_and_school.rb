class ChangeRelationBetweenDegreeAndSchool < ActiveRecord::Migration
  def change
	add_column :degrees, :school_id, :integer
	remove_column :schools, :degree_id
  end
end
