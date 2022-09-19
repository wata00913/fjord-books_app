# frozen_string_literal: true

class Report < ApplicationRecord
  validates :title, :posting_user_id, presence: true
  belongs_to :user, foreign_key: :posting_user_id,
                    inverse_of: :reports
end
