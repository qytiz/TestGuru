# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passeges, dependent: :destroy
  has_many :tests, through: :test_passeges
  def ended_on_level(level)
    Test.joins('JOIN test_passeges on test_passeges.user_id = user_id').where(tests: { level: level }, test_passeges: { user_id: id })
  end

<<<<<<< HEAD
=======
  has_many :test_passeges, dependent: :destroy
  has_many :tests, through: :test_passeges

>>>>>>> 81ac5a8c3c714cd0cdb061f6fcff0ff9c5924141
end
