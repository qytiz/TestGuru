# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passeges, dependent: :destroy
  has_many :tests, dependent: :destroy, through: :test_passeges

  validates :name, presence: true

  scope :ended_on_level, ->(level) { joins(:test_passeges).where(tests: { level: level }, test_passeges: { user_id: id }) }
end
