# frozen_string_literal: true

class User < ApplicationRecord
  def ended_on_level(level)
    Test.joins('JOIN test_passeges on test_passeges.user_id = user_id').where(tests: { level: level }, test_passeges: { user_id: id })
  end
end
