class RenameTypeColumnInDegree < ActiveRecord::Migration
  def change
	rename_column :degrees, :type, :d_type
  end
end
