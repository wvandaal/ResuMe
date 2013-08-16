class Company < ActiveRecord::Base
  attr_accessible :logo, :name, :website

  validates :name, presence: true
  validates :name, uniqueness: {scope: :website}
  validates_uniqueness_of :website

  has_many :positions
  has_many :employees, through: :positions, source: :users
end
