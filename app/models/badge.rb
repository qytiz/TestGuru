class Badge < ApplicationRecord
  BADGES_RULES = %i[first_time category level].freeze

  validates :title, presence: true
  validates :image_link, presence: true
  validates :badge_rule, presence: true

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :users_badges
end
