class RemoveSchoolIdFromDegree < ActiveRecord::Migration
  def change
	remove_column :degrees, :school_id
  end
end
