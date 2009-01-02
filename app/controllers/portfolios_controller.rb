class PortfoliosController < ApplicationController
  before_filter :login_required, :only=>[:create, :update, :destroy]
  # GET /portfolios
   # GET /portfolios.xml
   uses_tiny_mce(:options => {:theme => 'advanced',
                              #:browsers => %w{msie gecko safari},
                              :cleanup_on_startup => true,
                              :cleanup => true,
                              :theme_advanced_toolbar_location => "top",
                              :theme_advanced_toolbar_align => "center",
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => true,
                              :paste_auto_cleanup_on_paste => false,
                              :extended_valid_elements => "object[classid|codebase|width|height|align], param[name|value], embed[quality|type|pluginspage|width|height|src|align|wmode|allowscriptaccess|allowfullscreen|flashvars]",
                              :convert_urls => false,
                              :theme_advanced_buttons1 => %w{code template bold italic underline strikethrough separator justifyleft justifycenter justifyright separator bullist numlist separator link unlink image media hrcut suser formatselect},
                              :theme_advanced_buttons2 => [],
                              :theme_advanced_buttons3 => [],
                              :plugins => %w{contextmenu paste template safari media hrcut xhtmlxtras pagebreak suser},
                              :apply_source_formatting => true,
                              },
                 :only => [:new, :edit])
   def index
     @portfolios = Portfolio.paginate(:page => params[:page], :per_page=>10, :order => 'created_at DESC')
     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @portfolios }
     end
   end
   def tag
     @portfolios = Portfolio.paginate_tagged_with(params[:id], :page => params[:page], :per_page=>10, :order => 'created_at DESC')
     render :action=>:index
   end
   # GET /portfolios/1
   # GET /portfolios/1.xml
   def show
     @portfolio = Portfolio.find(params[:id])

     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @portfolio }
     end
   end

   # GET /portfolios/new
   # GET /portfolios/new.xml
   def new
     @portfolio = Portfolio.new

     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @portfolio }
     end
   end

   # GET /portfolios/1/edit
   def edit
     @portfolio = Portfolio.find(params[:id])
   end

   # POST /portfolios
   # POST /portfolios.xml
   def create
     @portfolio = Portfolio.new(params[:portfolio])

     respond_to do |format|
       if @portfolio.save
         flash[:notice] = 'Portfolio was successfully created.'
         format.html { redirect_to(@portfolio) }
         format.xml  { render :xml => @portfolio, :status => :created, :location => @portfolio }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @portfolio.errors, :status => :unprocessable_entity }
       end
     end
   end

   # PUT /portfolios/1
   # PUT /portfolios/1.xml
   def update
     @portfolio = Portfolio.find(params[:id])

     respond_to do |format|
       if @portfolio.update_attributes(params[:portfolio])
         flash[:notice] = 'Portfolio was successfully updated.'
         format.html { redirect_to(@portfolio) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @portfolio.errors, :status => :unprocessable_entity }
       end
     end
   end

   # DELETE /portfolios/1
   # DELETE /portfolios/1.xml
   def destroy
     @portfolio = Portfolio.find(params[:id])
     @portfolio.destroy

     respond_to do |format|
       format.html { redirect_to(portfolios_url) }
       format.xml  { head :ok }
     end
   end
  
end
