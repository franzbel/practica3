class AddLikeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :like, :integer
  end
end
