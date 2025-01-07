# RailsSettings Model
class Setting < RailsSettings::Base
  cache_prefix { "v1" }

  field :host,               type: :string,  default: "http://lvh.me:3000"
  field :site_name,          type: :string,  default: "Personal Blog"
  field :default_locale,     type: :string,  default: "en"
  field :default_website_id, type: :integer, default: Website.first&.id

  def default_website
    Website.find(default_website_id)
  end
end
