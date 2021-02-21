# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :self_tests, class_name: 'Test', foreign_key: :user_id, dependent: :nullify
  has_many :test_passages, dependent: :destroy
  has_many :tests, dependent: :destroy, through: :test_passages
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  def ended_on_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
  def have_name?
    first_name.present?||last_name.present?
  end
end
