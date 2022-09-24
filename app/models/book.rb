# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :commenters, through: :comments, source: :user
end
