class User < ActiveRecord::Base
	has_secure_password

  attr_accessible :first_name, :last_name, :password, :password_confirmation,
                  :session_token, :username, :admin, :title, :location,
                  :profile_pic, :school_id

  validates_uniqueness_of :username
  validates :first_name, :last_name, :username, presence: true

  mount_uploader :profile_pic, ImageUploader

  has_many :degrees
  has_many :schools, through: :degrees

  has_many :positions, dependent: :destroy
  has_many :employers, through: :positions, source: :company

  has_many :projects
  has_many :code_files, through: :projects

  belongs_to :school

  def menu_items
    items = []
    items << :education unless self.degrees.empty?
    # items << :honors
    items << :employment unless self.positions.empty?
    items << :code unless self.projects.empty?
    # items << :photos
    # items << :links
    items
  end
end
