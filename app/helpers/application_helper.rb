# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def cut_text text, full_url, link=nil
    if(m = /<hr\s[^>]*class\s*=\s*("|')?cut("|')?[^>]*>/i.match(text))
      text = Hpricot(text[0..(m.offset(0)[0] - 1)]).to_html + (link.nil? ? link_to("дальше...", full_url, :class => "info", :class=>"read-more") : "")+"<br/>"
    end
    return text
  end
  def create_link path
    logged_in? ? "("+link_to(image_tag("create.png"), path)+")" : ""
  end
  def createbanner_link path
    logged_in? ? "("+link_to("добавить баннер "+image_tag("create.png"), path)+")" : ""
  end
  
  def edit_link path
    logged_in? ? "("+link_to(image_tag("edit.png"), path)+")" : ""
  end
  
  def delete_link path
    logged_in? ? "("+link_to(image_tag("delete.png"), path, :confirm => 'Are you sure?', :method => :delete)+")" : ""
  end
  def minidelete_link path
     logged_in? ? link_to(image_tag("delete.png"), path, :confirm => 'Are you sure?', :method => :delete) : ""
   end
   
  def edit_delete_link edit_path, delete_path
    logged_in? ? (edit_link(edit_path)+" | "+delete_link(delete_path)) : ""
  end
  def logout_path
    logged_in? ? link_to("покинуть администрирование", "/logout") : ""
  end
  def imagesuppl_path
    logged_in? ? link_to("загрузить картинку", "/images") : ""
  end
  def chpasswd_path
    logged_in? ? link_to("поменять пароль", edit_user_path(current_user)) : ""
  end
end
