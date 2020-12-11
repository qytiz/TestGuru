class AddTestsTitleCIdNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :c_id, false)

  end
end
