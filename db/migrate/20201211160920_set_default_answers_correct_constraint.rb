class SetDefaultAnswersCorrectConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:answers, :a_correct, false)
  end
end
