class Degree < ActiveRecord::Base
  attr_accessible :concentration, :details, :end_date, :field, :gpa, :school_id, :start_date, :d_type, :user_id

  validates :d_type, :start_date, :user, :school, presence: true

  belongs_to :user, inverse_of: :degrees
  belongs_to :school, inverse_of: :degrees
end
