class Journal < ApplicationRecord
  belongs_to :user
  validates :subject, :body, :presence => {:message => "empty value found"}

  def start_time
    self.created_at.to_date
  end

  def to_param
    subject
  end
end
