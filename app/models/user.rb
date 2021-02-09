# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, dependent: :destroy, through: :test_passages

  has_secure_password

  validates_uniqueness_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, on: :create

  def ended_on_level(level)
    Test.joins('JOIN test_passages ON test_passages.test_id = tests.id').where(tests: { level: level },
                                                                               test_passages: { user_id: id })
  end
  def own_test_build(test)
  test.user_id=id
  test
  end
  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
