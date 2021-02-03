# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, dependent: :destroy, through: :test_passages

  validates :name, presence: true

  scope :ended_on_level, lambda { |level|
                           joins(:test_passages).where(tests: { level: level }, test_passages: { user_id: id })
                         }
end
