class Journal < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :viewers, class_name: 'User', join_table: 'journal_viewers'
  validates :subject, :body, :presence => {:message => "empty value found"}

  def start_time
    self.created_at.to_date
  end

end
