class ClientsController < ApplicationController
  # GET /clients
   # GET /clients.xml
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
     @clients = Client.paginate(:page => params[:page], :per_page=>10, :order => 'created_at DESC')
     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @clients }
     end
   end
   def tag
     @clients = Client.paginate_tagged_with(params[:id], :page => params[:page], :per_page=>10, :order => 'created_at DESC')
     render :action=>:index
   end
   # GET /clients/1
   # GET /clients/1.xml
   def show
     @client = Client.find(params[:id])

     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @client }
     end
   end

   # GET /clients/new
   # GET /clients/new.xml
   def new
     @client = Client.new

     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @client }
     end
   end

   # GET /clients/1/edit
   def edit
     @client = Client.find(params[:id])
   end

   # POST /clients
   # POST /clients.xml
   def create
     @client = Client.new(params[:client])

     respond_to do |format|
       if @client.save
         flash[:notice] = 'Client was successfully created.'
         format.html { redirect_to(@client) }
         format.xml  { render :xml => @client, :status => :created, :location => @client }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
       end
     end
   end

   # PUT /clients/1
   # PUT /clients/1.xml
   def update
     @client = Client.find(params[:id])

     respond_to do |format|
       if @client.update_attributes(params[:client])
         flash[:notice] = 'Client was successfully updated.'
         format.html { redirect_to(@client) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
       end
     end
   end

   # DELETE /clients/1
   # DELETE /clients/1.xml
   def destroy
     @client = Client.find(params[:id])
     @client.destroy

     respond_to do |format|
       format.html { redirect_to(clients_url) }
       format.xml  { head :ok }
     end
   end
  
end
