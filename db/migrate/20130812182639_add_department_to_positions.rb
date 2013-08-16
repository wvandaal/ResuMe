class AddDepartmentToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :department, :string
  end
end
