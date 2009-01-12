class WelcomeController < ApplicationController
  def index
    @blogs = Blog.paginate(:page => params[:page], :per_page=>5, :order => 'created_at DESC')
    @bigbord = Bigbord.last
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blogs }
    end
  end
end
