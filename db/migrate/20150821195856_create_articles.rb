class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :content
      t.string :ancestry

      t.timestamps null: false
    end
    add_index :articles, :ancestry
  end
end
