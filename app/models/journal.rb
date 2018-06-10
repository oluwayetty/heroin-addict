class Journal < ApplicationRecord
  belongs_to :user
  validates :subject, :body, :presence => {:message => "empty value found"}

  # def donations_for_date(date)
  #   user_offset = self.timezone ? TZInfo::Timezone.get(self.timezone).current_period.utc_offset : 0
  #   start_of_today = date.beginning_of_day - user_offset
  #   end_of_today = date.end_of_day - user_offset
  #   donations.where('donation_date BETWEEN ? AND ?', start_of_today, end_of_today).try(:any?)
  # end
end
