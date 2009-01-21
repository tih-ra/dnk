# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def cut_text text, full_url
    if(m = /<hr\s[^>]*class\s*=\s*("|')?cut("|')?[^>]*>/i.match(text))
      text = Hpricot(text[0..(m.offset(0)[0] - 1)]).to_html + link_to("дальше...", full_url, :class => "info", :class=>"read-more")+"<br/>"
    end
    return text
  end
end
