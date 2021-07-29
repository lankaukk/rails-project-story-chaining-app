class Contribution < ApplicationRecord
    belongs_to :user
    belongs_to :story

    validates :body, length: { in: 6..100 }

end
