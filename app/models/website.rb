class Website < ApplicationRecord

  has_many :website_posts
  has_many :posts, through: :website_posts

  has_rich_text :tagline
  has_rich_text :description

  validates :name,        presence: true
  validates :tagline,     presence: true
  validates :subdomain,   presence: true, uniqueness: true
  validates :description, presence: true
  validates :linkedin_url,  format: { with: URI::DEFAULT_PARSER.make_regexp, message: 'Must be a valid url: https://...' }
  validates :instagram_url, format: { with: URI::DEFAULT_PARSER.make_regexp, message: 'Must be a valid url: https://...' }
  validates :twitter_url,   format: { with: URI::DEFAULT_PARSER.make_regexp, message: 'Must be a valid url: https://...' }
  validates :facebook_url,  format: { with: URI::DEFAULT_PARSER.make_regexp, message: 'Must be a valid url: https://...' }
  validates :youtube_url,   format: { with: URI::DEFAULT_PARSER.make_regexp, message: 'Must be a valid url: https://...' }
  validates :github_url,    format: { with: URI::DEFAULT_PARSER.make_regexp, message: 'Must be a valid url: https://...' }
  validates :dribbble_url,  format: { with: URI::DEFAULT_PARSER.make_regexp, message: 'Must be a valid url: https://...' }
  validates :strava_url,    format: { with: URI::DEFAULT_PARSER.make_regexp, message: 'Must be a valid url: https://...' }
end
