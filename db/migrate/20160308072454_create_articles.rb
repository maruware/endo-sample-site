class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :articles, :users
  end
end
