# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :following_relationships, class_name: 'FollowRelationship', foreign_key: :following_id
  has_many :follower_relationships, class_name: 'FollowRelationship', foreign_key: :followed_id
  has_many :followings, through: :following_relationships, source: :followed
  has_many :followers, through: :follower_relationships, source: :following
end
