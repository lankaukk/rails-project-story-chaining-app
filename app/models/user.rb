class User < ApplicationRecord
    has_secure_password
    has_many  :contributions
    has_many :stories, through: :contributions
end
