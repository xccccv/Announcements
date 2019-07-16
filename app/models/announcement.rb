# frozen_string_literal: true

# announcement model
class Announcement < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy

  has_one :user
  mount_uploader :avatar, AvatarUploader

  scope :active, -> { where(activity: true) }
  scope :sorted, -> { order('Position ASC') }

  scope :sortedByDate, -> { order('created_at DESC') }
end
