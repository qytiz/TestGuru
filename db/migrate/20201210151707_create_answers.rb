class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :a_title
      t.boolean :a_correct
      t.integer :q_id

      t.timestamps
    end
  end
end
