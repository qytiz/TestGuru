class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null:false
      t.string :image_link, null:false
      t.string :option, null:false
      t.string :badge_rule, null:false
      t.timestamps
    end
  end
end
