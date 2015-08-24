class AddDetailsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :details, :hstore
  end
end
