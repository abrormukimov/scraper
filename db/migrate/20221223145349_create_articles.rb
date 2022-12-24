class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :headline
      t.string :published_at
      t.string :url

      t.timestamps
    end
  end
end
