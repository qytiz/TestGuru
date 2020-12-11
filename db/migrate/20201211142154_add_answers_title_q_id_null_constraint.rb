class AddAnswersTitleQIdNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :a_title, false)
    change_column_null(:answers, :q_id, false)
  end
end
