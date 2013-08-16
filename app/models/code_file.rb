class CodeFile < ActiveRecord::Base
  attr_accessible :code, :description, :language, :pathname, :project_id

  belongs_to :project, inverse_of: :code_files
  has_one :user, through: :project

  validates :code, :language, :pathname, :project, presence: true
  validates :pathname, uniqueness: {scope: :project_id}
end
