json.extract! post, :id, :name, :content, :page_type, :published_at, :is_pinned, :visibility, :slug, :created_at, :updated_at
json.url post_url(post, format: :json)
