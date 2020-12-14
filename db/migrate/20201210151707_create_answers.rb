class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :title
      t.boolean :correct
      t.integer :question
      t.timestamps
    end
    change_column_null(:answers, :title, false)
    change_column_null(:answers, :question, false)
    change_column_default(:answers, :correct, false)
  end
end
