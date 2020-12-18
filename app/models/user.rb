class User < ApplicationRecord
  def ended_on_level(level)
    Test.joins('INNER JOIN').where('testing_histories.user_id': id, level: level)
  end
end
