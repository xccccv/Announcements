class Announcement < ApplicationRecord

    has_many :comments, dependent: :destroy
    has_many :tags, dependent: :destroy

    has_one :user 
    mount_uploader :avatar, AvatarUploader

    scope :active, lambda { where(:activity => true) }
    scope :sorted, lambda { order("Position ASC") }

    scope :sortedByDate, lambda { order("created_at DESC")}
end 