class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: 'User', foreign_key: :posting_user_id, inverse_of: :comments
end
