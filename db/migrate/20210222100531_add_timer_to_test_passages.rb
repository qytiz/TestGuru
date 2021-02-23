class AddTimerToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :started_at, :datetime
    add_column :test_passages, :end_at, :datetime
  end
end
