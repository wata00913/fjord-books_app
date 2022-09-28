# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :following_relationships, -> { order(:created_at) },
           class_name: 'FollowRelationship', foreign_key: :following_id,
           dependent: :destroy, inverse_of: :following
  has_many :follower_relationships, -> { order(:created_at) },
           class_name: 'FollowRelationship', foreign_key: :followed_id,
           dependent: :destroy, inverse_of: :followed
  has_many :followings, through: :following_relationships, source: :followed
  has_many :followers, through: :follower_relationships, source: :following

  def follow(other)
    if following?(other)
      errors.add(:id, :already_follow)
      return nil
    end

    followings << other
  end

  def unfollow(other)
    unless following?(other)
      errors.add(:id, :already_unfollow)
      return nil
    end

    followings.destroy(other)
  end

  def following?(other)
    followings.exists?(other.id)
  end

  def count_following
    followings.count
  end

  def count_follower
    followers.count
  end
end
