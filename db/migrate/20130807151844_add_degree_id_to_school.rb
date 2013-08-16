class AddDegreeIdToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :degree_id, :integer
  end
end
