class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :title, null: false
      t.boolean :correct, default: false
<<<<<<< Updated upstream
      t.references :questions, null: false, foreign_key: true
=======
      t.references :question, null: false, foreign_key: true
>>>>>>> Stashed changes
      t.timestamps
    end
  end
end
