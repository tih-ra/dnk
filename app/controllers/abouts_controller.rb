class AboutsController < ApplicationController
  # GET /abouts
   # GET /abouts.xml
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
     @abouts = About.paginate(:page => params[:page], :per_page=>10, :order => 'created_at DESC')
     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @abouts }
     end
   end
   def tag
     @abouts = About.paginate_tagged_with(params[:id], :page => params[:page], :per_page=>10, :order => 'created_at DESC')
     render :action=>:index
   end
   # GET /abouts/1
   # GET /abouts/1.xml
   def show
     @about = About.find(params[:id])

     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @about }
     end
   end

   # GET /abouts/new
   # GET /abouts/new.xml
   def new
     @about = About.new

     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @about }
     end
   end

   # GET /abouts/1/edit
   def edit
     @about = About.find(params[:id])
   end

   # POST /abouts
   # POST /abouts.xml
   def create
     @about = About.new(params[:about])

     respond_to do |format|
       if @about.save
         flash[:notice] = 'About was successfully created.'
         format.html { redirect_to(@about) }
         format.xml  { render :xml => @about, :status => :created, :location => @about }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @about.errors, :status => :unprocessable_entity }
       end
     end
   end

   # PUT /abouts/1
   # PUT /abouts/1.xml
   def update
     @about = About.find(params[:id])

     respond_to do |format|
       if @about.update_attributes(params[:about])
         flash[:notice] = 'About was successfully updated.'
         format.html { redirect_to(@about) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @about.errors, :status => :unprocessable_entity }
       end
     end
   end

   # DELETE /abouts/1
   # DELETE /abouts/1.xml
   def destroy
     @about = About.find(params[:id])
     @about.destroy

     respond_to do |format|
       format.html { redirect_to(abouts_url) }
       format.xml  { head :ok }
     end
   end
  
end
