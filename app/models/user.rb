class User < ApplicationRecord
    has_secure_password
    has_many  :contributions
    has_many :stories, through: :contributions

    validates :email, presence: true
    validates :email, uniqueness: true
    
    validates :bio, length: { maximum: 200 }

    def self.find_or_create_from_github(auth)
        user = User.find_or_create_by(email: auth['info']['email']) do |u|
            u.password = SecureRandom.hex(12)
            u.first_name = auth[:info][:email]
            u.email = auth[:info][:email]
        end
    end
    
end
