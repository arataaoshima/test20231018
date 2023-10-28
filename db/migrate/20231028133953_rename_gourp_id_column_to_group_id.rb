class RenameGourpIdColumnToGroupId < ActiveRecord::Migration[7.0]
  def change
    rename_column :article_groups, :gorup_id, :group_id
  end
end
