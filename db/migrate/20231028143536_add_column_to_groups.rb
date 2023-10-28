class AddColumnToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :test_number, :integer
  end
end
