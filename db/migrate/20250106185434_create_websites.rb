class CreateWebsites < ActiveRecord::Migration[8.0]
  def change
    create_table :websites do |t|
      t.string :name
      t.text   :tagline
      t.text   :description
      t.string :subdomain
      t.string :custom_domain

      t.timestamps
    end
  end
end
