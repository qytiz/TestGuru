class AddTotalScoreToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :total_score, :integer
  end
end
