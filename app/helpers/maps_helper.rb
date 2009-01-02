module MapsHelper
  def map_content_for cityname
    city = Citymap.find_by_city(cityname)
    city.content.blank? ? '' : city.content
  end
end
