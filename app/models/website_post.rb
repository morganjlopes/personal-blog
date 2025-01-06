class WebsitePost < ApplicationRecord
  belongs_to :website
  belongs_to :post
end
