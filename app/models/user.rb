class User < ApplicationRecord
    
    has_secure_password 

    has_many :announcements
    has_many :comments

    scope :sorted, -> { order('first_name ASC, last_name ASC')}

    mount_uploader :avatar, AvatarUploader
    
    def name 
        "#{first_name} #{last_name}"
    end 
end 