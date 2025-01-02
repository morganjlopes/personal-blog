class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string   :name
      t.text     :content
      t.integer  :page_type,  default: 0
      t.integer  :visibility, default: 0
      t.boolean  :is_pinned,  default: false
      t.datetime :published_at
      t.string   :slug

      t.timestamps
    end
  end
end
