class User < ApplicationRecord
  def ended_on_level(level)
    Test.joins('JOIN TestPassege on TestPassege.user_id = user_id').where(tests:{level: level},TestPassege:{user_id:id})
  end
end
