class CreateComplitedHistoryTests < ActiveRecord::Migration[6.0]
  def change
    create_table :complited_history_tests do |t|
      t.boolean :complited, default: false
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false
    end
  end
end
