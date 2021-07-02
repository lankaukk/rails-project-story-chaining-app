class User < ApplicationRecord
    has_many  :contributions
    has_many :stories, through: :contributions
end
