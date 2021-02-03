# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :passing_users, dependent: :destroy, through: :test_passages, source: :user

  validates :title, :level, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level, message: 'Идентичный тест уже существует' }

  scope :easy, -> { where(level: (0..1)) }
  scope :medium, -> { where(level: (2..4)) }
  scope :hard, -> { where(level: (5..Float::INFINITY)) }

  scope :from_category, ->(category) { joins(:category).where(categories: { title: category }).order(title: :desc) }

  def self.tests_with_category(category)
    Test.from_category(category).pluck(:title)
  end
end
