class Position < ActiveRecord::Base
  attr_accessible :company_id, :description, :end_date, :location, :start_date, :title, 
  :user_id, :department, :company_attributes

  validates :user, :company, :start_date, :title, presence: true

  belongs_to :user, inverse_of: :positions
  belongs_to :company, inverse_of: :positions

  accepts_nested_attributes_for :company, reject_if: :all_blank

  default_scope order('start_date DESC')
end
