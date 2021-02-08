# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, dependent: :destroy, through: :test_passages

  validates :name, presence: true

  def ended_on_level(level)
    Test.joins('JOIN test_passages ON test_passages.test_id = tests.id').where(tests: { level: level },
                                                                               test_passages: { user_id: id })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
