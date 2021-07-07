class User < ApplicationRecord
    has_secure_password
    has_many  :contributions
    has_many :stories, through: :contributions

    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: true
    
    validates :bio, length: { maximum: 500 }

end
