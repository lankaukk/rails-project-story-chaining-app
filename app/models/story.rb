class Story < ApplicationRecord
    has_many  :contributions
    has_many :users, through: :contributions
    belongs_to :category

    validates :hook, length: { maximum: 50 }
    validates :hook, presence: true

    scope :most_recent, -> {order('created_at DESC')}
end
