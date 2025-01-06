class Website < ApplicationRecord

  has_many :website_posts
  has_many :posts, through: :website_posts

  has_rich_text :tagline
  has_rich_text :description

  validates :name,        presence: true
  validates :tagline,     presence: true
  validates :subdomain,   presence: true, uniqueness: true
  validates :description, presence: true
end
