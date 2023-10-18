class CreateArticleGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :article_groups do |t|
      t.integer :article_id
      t.integer :gorup_id

      t.timestamps
    end
  end
end
