class AddSocialProfilesToWebsites < ActiveRecord::Migration[8.0]
  def change
    add_column :websites, :youtube_url,   :string
    add_column :websites, :twitter_url,   :string
    add_column :websites, :facebook_url,  :string
    add_column :websites, :instagram_url, :string
    add_column :websites, :linkedin_url,  :string
    add_column :websites, :github_url,    :string
    add_column :websites, :dribbble_url,  :string
    add_column :websites, :strava_url,    :string
  end
end
