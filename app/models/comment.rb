# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: 'User', foreign_key: :posting_user_id, inverse_of: :comments
  validates :content, :posting_user_id, presence: true
end
