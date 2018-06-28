class RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      usernames = params[:addict_usernames].to_s.split(/\s*,\s*/).map(&:downcase).uniq
      user.update(addicts: User.where(username: usernames))
    end
  end
end
