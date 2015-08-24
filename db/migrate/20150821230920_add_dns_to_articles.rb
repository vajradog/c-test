class AddDnsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :dns, :string
  end
end
