class Post < ApplicationRecord
  include PgSearch::Model
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :website_posts
  has_many :websites, through: :website_posts

  has_rich_text :content

  scope :recent,              -> { where('published_at > ?', 1.month.ago) }
  scope :published,           -> { where.not(published_at: nil).where('published_at <= ?', Time.zone.now).order(published_at: :desc) }
  scope :drafts,              -> { where(published_at: nil) }
  scope :scheduled,           -> { where('published_at > ?', Time.now) }
  scope :publicly_searchable, -> { published.where(visibility: :public) }
  scope :with_tag,            ->(tag) { where("tags @> ?", "[\"#{tag}\"]") }

  pg_search_scope :contains,
                  against: {
                    name:    'A',
                    tags:    'B',
                    content: 'C',
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
  
  enum :page_type, [
    :post,
    :page,
    :social
  ], prefix: true
  
  enum :visibility, [
    :public,
    :private,
    :hidden
  ], prefix: true

  attr_accessor :tags_as_string
  
  validates :name, presence: true
  validates :content, presence: true

  before_save :_set_tags_from_string

  def summary
    content.to_plain_text.truncate(400)
  end

  def published_on
    published_at&.to_date
  end

  def self.next_unscheduled_date
    scheduled_dates = Post.scheduled.pluck("DATE(published_at)")
    current_date    = 1.day.from_now.to_date
  
    (current_date..).find { |date| scheduled_dates.include?(date) == false }
  end

  def self.tags
    # remove nil
    self.pluck(:tags).flatten.uniq.compact
  end

  private

  def _set_tags_from_string
    return if tags_as_string.blank?
    
    # Remove any whitespace from the string
    self.tags = tags_as_string.split(",").map(&:strip)
  end
end
