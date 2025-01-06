class Post < ApplicationRecord
  include PgSearch::Model
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_rich_text :content

  scope :recent,              -> { where('published_at > ?', 1.month.ago) }
  scope :published,           -> { where.not(published_at: nil).order(published_at: :desc) }
  scope :drafts,              -> { where(published_at: nil) }
  scope :scheduled,           -> { where('published_at > ?', Time.zone.now) }
  scope :publicly_searchable, -> { published.where(visibility: :public) }

  pg_search_scope :contains,
                  against: {
                    name:    'A',
                    content: 'B',
                  },
                  using: {
                      # :trigram => {},
                      # :dmetaphone => {},
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
  
  validates :name, presence: true
  validates :content, presence: true

  def self.next_unscheduled_date
    scheduled_dates = Post.published.pluck("DATE(published_at)")
    current_date    = Time.zone.today
  
    (current_date..).find { |date| scheduled_dates.include?(date) == false }
  end
end
