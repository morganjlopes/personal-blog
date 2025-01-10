xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title Setting.site_name
    xml.description "Some random description."
    xml.link posts_url
    xml.tag!("atom:link", href: feed_url(format: :rss), rel: "self", type: "application/rss+xml")

    @posts.each do |post|
      xml.item do
        xml.title       post.name
        xml.description strip_tags(post.content)
        xml.pubDate     post.published_at.rfc822
        xml.link        post_url(post)
        xml.guid        post_url(post)
      end
    end
  end
end
