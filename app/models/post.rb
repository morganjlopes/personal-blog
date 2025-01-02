class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_rich_text :content
  
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
end
