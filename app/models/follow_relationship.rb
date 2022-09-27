class FollowRelationship < ApplicationRecord
  belongs_to :following, class_name: 'User'
  belongs_to :followed, class_name: 'User'
  validate :must_be_other, on: :create

  def must_be_other
    errors.add(:followed_id, :must_be_other) if following_id == followed_id
  end
end
