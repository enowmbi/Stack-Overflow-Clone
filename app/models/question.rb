class Question < ActiveRecord::Base
  validates :description, :datetime, :presence => true
  has_many :answers
  belongs_to :user
  scope :datetime, -> { order(created_at: :desc) }
end
