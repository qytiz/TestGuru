# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passeges, dependent: :destroy
  has_many :tests, through: :test_passeges
  def ended_on_level(level)
    Test.joins('JOIN test_passeges on test_passeges.user_id = user_id').where(tests: { level: level }, test_passeges: { user_id: id })
  end


  has_many :test_passeges, dependent: :destroy
  has_many :tests, through: :test_passeges



end
