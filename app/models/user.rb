# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord
  has_many :self_tests, class_name: 'Test', foreign_key: :user_id, dependent: :nullify
  has_many :test_passages, dependent: :destroy
  has_many :tests, dependent: :destroy, through: :test_passages

  has_secure_password

  validates_uniqueness_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, on: :create

  def ended_on_level(level)
    tests.where(level: level)
  end
  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
