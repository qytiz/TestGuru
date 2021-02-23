class AddTimeLimitToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :timer_in_minutes, :integer
  end
end
