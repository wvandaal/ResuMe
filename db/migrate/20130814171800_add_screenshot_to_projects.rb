class AddScreenshotToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :screenshot, :string
  end
end
