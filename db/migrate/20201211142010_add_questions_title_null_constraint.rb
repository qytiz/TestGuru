class AddQuestionsTitleNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:questions, :q_title, false)
  end
end
