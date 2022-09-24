# frozen_string_literal: true

module UsersHelper
  def name_or_email(user)
    user.name.nil? ? user.email : user.name
  end
end
