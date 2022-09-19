# frozen_string_literal: true

class Report < ApplicationRecord
  validates :title, :posting_user_id, presence: true
end
