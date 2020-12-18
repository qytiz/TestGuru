class CreateCreateComplitedHistoryTests < ActiveRecord::Migration[6.0]
  def change
    create_table :create_complited_history_tests do |t|
      t.timestamps
    end
  end
end
