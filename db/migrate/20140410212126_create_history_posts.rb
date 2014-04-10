class CreateHistoryPosts < ActiveRecord::Migration
  def change
    create_table :history_posts do |t|
      t.string :titulo
      t.text :contenido
      t.datetime :actualizado
      t.integer :article_id

      t.timestamps
    end
  end
end
