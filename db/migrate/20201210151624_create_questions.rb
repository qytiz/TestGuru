class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
<<<<<<< Updated upstream
      t.references :tests, null: false, foreign_key: true
      
=======
      t.references :test, null: false, foreign_key: true

>>>>>>> Stashed changes
      t.timestamps
    end
  end
end
