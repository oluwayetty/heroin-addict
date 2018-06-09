class Journal < ApplicationRecord
  belongs_to :user
  validates :subject, :body, :presence => {:message => "empty value found"}
end
