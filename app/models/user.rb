class User < ApplicationRecord
    has_secure_password
    has_many  :contributions
    has_many :stories, through: :contributions

    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: true
    
    validates :bio, length: { maximum: 500 }

    def self.find_or_create_from_github(auth)
        # user = user.find_or_create_by(email: auth["info"]["email"]) do |u|
        #     u.password = SecureRandom.hex
        #     u.email = auth[:info][:email]
        # end
        user = User.find_or_create_by(email: auth['info']['email']) do |u|
            u.password = SecureRandom.hex(12)
        end
    end
    
end
