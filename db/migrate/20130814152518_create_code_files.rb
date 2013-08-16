class CreateCodeFiles < ActiveRecord::Migration
  def change
    create_table :code_files do |t|
      t.string :pathname
      t.string :language
      t.text :code
      t.text :description
      t.integer :project_id

      t.timestamps
    end
  end
end
