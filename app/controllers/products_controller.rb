class ProductsController < ApplicationController
  before_filter :login_required, :only=>[:create, :update, :destroy]
  # GET /products
   # GET /products.xml
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
     @products = Product.paginate(:page => params[:page], :per_page=>10, :order => 'created_at DESC')
     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @products }
     end
   end
   def tag
     @products = Product.paginate_tagged_with(params[:id], :page => params[:page], :per_page=>10, :order => 'created_at DESC')
     render :action=>:index
   end
   # GET /products/1
   # GET /products/1.xml
   def show
     @product = Product.find(params[:id])
     @title = @product.title
     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @product }
     end
   end

   # GET /products/new
   # GET /products/new.xml
   def new
     @product = Product.new

     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @product }
     end
   end

   # GET /products/1/edit
   def edit
     @product = Product.find(params[:id])
   end

   # POST /products
   # POST /products.xml
   def create
     @product = Product.new(params[:product])

     respond_to do |format|
       if @product.save
         flash[:notice] = 'Product was successfully created.'
         format.html { redirect_to(@product) }
         format.xml  { render :xml => @product, :status => :created, :location => @product }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
       end
     end
   end

   # PUT /products/1
   # PUT /products/1.xml
   def update
     @product = Product.find(params[:id])

     respond_to do |format|
       if @product.update_attributes(params[:product])
         flash[:notice] = 'Product was successfully updated.'
         format.html { redirect_to(@product) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
       end
     end
   end

   # DELETE /products/1
   # DELETE /products/1.xml
   def destroy
     @product = Product.find(params[:id])
     @product.destroy

     respond_to do |format|
       format.html { redirect_to(products_url) }
       format.xml  { head :ok }
     end
   end
  
end
