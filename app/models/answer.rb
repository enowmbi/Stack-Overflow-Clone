class Answer < ActiveRecord::Base
  validates :description, :presence => true
  belongs_to :question
end
