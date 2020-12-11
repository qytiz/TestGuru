class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :t_created
      t.integer :t_complited


      t.timestamps
    end
  end
end
