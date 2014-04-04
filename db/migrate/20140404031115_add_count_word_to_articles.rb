class AddCountWordToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :count_word, :integer
  end
end
