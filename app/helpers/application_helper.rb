module ApplicationHelper

  def format_date(datetime)
    datetime&.strftime("%b %d, %Y")
  end

  def convert_merge_tags(content)
    converted_content = content.split("<br>").map do |line|
      if line.include?("https://www.youtube.com/")
        youtube_embed(line)
      elsif line.include?("https://www.loom.com/")
        loom_embed(line)
      else
        line
      end
    end

    converted_content.join("<br>")
  end

  def youtube_embed(string)
    video_id = string.split("v=").last
    "<div style='position: relative; padding-bottom: 50vh; height: 0;' class='rounded rounded-2 overflow-hidden'><iframe src='https://www.youtube.com/embed/#{video_id}' webkitallowfullscreen mozallowfullscreen allowfullscreen style='position: absolute; top: 0; left: 0; width: 100%; height: 100%;'></iframe></div>"
  end

  def loom_embed(string)
    video_id = string.split("https://www.loom.com/share/").last
    "<div style='position: relative; padding-bottom: 50vh; height: 0;' class='rounded rounded-2 overflow-hidden'><iframe src='https://www.loom.com/embed/#{video_id}' frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen style='position: absolute; top: 0; left: 0; width: 100%; height: 100%;'></iframe></div>"
  end
end
