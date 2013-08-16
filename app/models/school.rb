class School < ActiveRecord::Base
  attr_accessible :address, :logo, :name, :website

  validates :name, :website, :address, presence: true
  validates_uniqueness_of :website
  validates :name, uniqueness: {scope: :website}

  has_many :degrees
  has_many :users, through: :degrees

  has_many :alumni, class_name: "User"
end
