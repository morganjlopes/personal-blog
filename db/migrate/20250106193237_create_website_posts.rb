class CreateWebsitePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :website_posts do |t|
      t.references :website, null: false, foreign_key: true
      t.references :post,    null: false, foreign_key: true

      t.timestamps
    end
  end
end
