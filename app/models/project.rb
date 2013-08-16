class Project < ActiveRecord::Base
	require 'builder'

  attr_accessible :description, :subtitle, :title, :user_id, :screenshot

  mount_uploader :screenshot, ScreenshotUploader

  belongs_to :user, inverse_of: :projects
  has_many :code_files

  validates :title, :user, presence: true
  validates :title, uniqueness: {scope: :user_id}

  def generate_file_tree
  	path_hash = Hash.new{ |h,k| h[k] = Hash.new &h.default_proc }

		self.code_files.each do |file|
		  sub = path_hash
		  file.pathname.split( "/" ).each do |dir| 
		  	dir += "/" unless dir.include?(".")
		  	sub[dir] = file if dir.include?(".")
		  	sub = sub[dir] 
		  end
		end

		path_hash
	end
end
