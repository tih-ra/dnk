class MapsController < ApplicationController
  before_filter :login_required, :only=>[:create, :update, :destroy]
  def index
    Citymap::CITIES.each do |key|
      Citymap.find_or_create_by_city(key)
    end
  end
  def edit
    @maps = Citymap.all(:order=>"city")
  end
  def update
    @map = Citymap.find(params[:id])
    @map.update_attributes(params[:map])
    @map.save
    redirect_to edit_map_path(1)
  end
  def list
    @maps = Citymap.all
    respond_to do |format|
      format.xml  { }
    end
  end
end
